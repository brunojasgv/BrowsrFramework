//
//  BrowsrGenericAPI.swift
//  BrowsrFramework
//
//  Created by BRUNO VASCONCELOS on 27/01/2023.
//

import Foundation

public let BASE_URL = "https://api.github.com"

public enum APIRouter {
    case fetchOrg(page: Int)
    case searchOrg(name: String)
    case sortOrg(page: Int, sortType: String)
    
    var path: String {
        switch self {
            case .fetchOrg:
                return "/search/users?q=type:org&per_page=50&page="
            case .searchOrg:
                return "/search/users?q=org:"
            case .sortOrg:
                return "/search/users?q=type:org&per_page=50&"
        }
    }
    
    var method: String {
        switch self {
            case .fetchOrg, .searchOrg, .sortOrg:
                return "GET"
        }
    }
    
    // MARK: - Paremeters
    var parameters: String {
        switch self {
            case .fetchOrg(let page):
                return "\(page)"
            case .searchOrg(let name):
                return "\(name)"
            case .sortOrg(let page, let sortType):
                return "page=\(page)" + "&sort=\(sortType)"
        }
    }
}

// MARK: - Generic request call
@available(iOS 13.0.0, *)
public func request<T: Codable>(apiRouter: APIRouter) async throws -> T {
    
    let urlComponents = URLComponents(string: BASE_URL + apiRouter.path + apiRouter.parameters)!

    guard let url = urlComponents.url else { throw BrowsrAPIError.invalidURL }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = apiRouter.method
    
    let session = URLSession(configuration: .default)
    return try await withCheckedThrowingContinuation { continuation in
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                return continuation.resume(with: .failure(BrowsrAPIError.requestFailed(description: error.localizedDescription)))
            }
            
            guard let data = data else {
                return continuation.resume(with: .failure(BrowsrAPIError.invalidData))
            }
            
            do {
                let responseObject = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    return continuation.resume(with: .success(responseObject))
                }
            } catch let error {
                return continuation.resume(with: .failure(BrowsrAPIError.jsonConversionFailure(description: error.localizedDescription)))
            }
        }
        dataTask.resume()
    }
}
