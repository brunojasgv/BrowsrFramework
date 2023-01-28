//
//  Browsr.swift
//  BrowsrFramework
//
//  Created by BRUNO VASCONCELOS on 26/01/2023.
//


//public struct BrowsrFramework {
//    public private(set) var text = "Hello, World!"
//
//    public init() {
//    }
//}

import Foundation


public struct Browsr {
    
    public init() {
        
    }
    
    public func doSomeWork() {
        
    }
    
    @available(iOS 13.0.0, *)
    public func fetchOrgs(page: Int) async throws -> [Item] {
        let response: Model = try await BrowsrAsyncAPI.request(apiRouter: .fetchOrg(page: page))
        return response.items
    }
    
    @available(iOS 13.0.0, *)
    public func searchOrgs(name: String) async throws -> [Item] {
        let response: Model = try await BrowsrAsyncAPI.request(apiRouter: .searchOrg(name: name))
        return response.items
    }
    
    @available(iOS 13.0.0, *)
    public func sortOrgs(page: Int, sortType: String) async throws -> [Item] {
        let response: Model = try await BrowsrAsyncAPI.request(apiRouter: .sortOrg(page: page, sortType: sortType))
        return response.items
    }

}
