//
//  Browsr.swift
//  BrowsrFramework
//
//  Created by BRUNO VASCONCELOS on 26/01/2023.
//


import Foundation

public struct Browsr {
    
    public let item: Item? = nil
    
    public init() {}

    @available(iOS 13.0.0, *)
    public func fetchOrgs(page: Int) async throws -> [Item] {
        let response: Model = try await request(apiRouter: .fetchOrg(page: page))
        return response.items
    }
    
    @available(iOS 13.0.0, *)
    public func searchOrgs(name: String) async throws -> [Item] {
        let response: Model = try await request(apiRouter: .searchOrg(name: name))
        return response.items
    }
    
    @available(iOS 13.0.0, *)
    public func sortOrgs(page: Int, sortType: String) async throws -> [Item] {
        let response: Model = try await request(apiRouter: .sortOrg(page: page, sortType: sortType))
        return response.items
    }

}
