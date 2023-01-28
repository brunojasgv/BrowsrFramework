//
//  BrowsrAPIError.swift
//  BrowsrFramework
//
//  Created by BRUNO VASCONCELOS on 26/01/2023.
//

import Foundation

// MARK: - Browsr API Error
public enum BrowsrAPIError: Error {

    case requestFailed(description: String)
    case jsonConversionFailure(description: String)
    case invalidData
    case responseUnsuccessful(description: String)
    case jsonParsingFailure
    case noInternet
    case failedSerialization
    case invalidURL

    // MARK: - Error types description
    public var customDescription: String {
        switch self {
            case .invalidURL: return "Invalid Url"
        case let .requestFailed(description): return "Request Failed error -> \(description)"
        case .invalidData: return "Invalid Data error)"
        case let .responseUnsuccessful(description): return "Response Unsuccessful error: \(description)"
        case .jsonParsingFailure: return "JSON Parsing Failure error"
        case let .jsonConversionFailure(description): return "JSON decoding Failure: \(description)"
        case .noInternet: return "No internet connection"
        case .failedSerialization: return "Serialization failed."
        }
    }
}
