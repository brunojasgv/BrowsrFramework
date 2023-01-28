//
//  Model.swift
//  BrowsrFramework
//
//  Created by BRUNO VASCONCELOS on 27/01/2023.
//

import Foundation

// MARK: - Model
public struct Model: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Item]
    
    public enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
public struct Item: Codable, Hashable {
    public let login: String
    public let id: Int
    public let nodeID: String
    public let avatarURL: String
    public let gravatarID: String
    public let url: String
    public let htmlURL: String
    public let followersURL: String
    public let subscriptionsURL: String
    public let organizationsURL: String
    public let reposURL: String
    public let receivedEventsURL: String
    public let type: String
    public let score: Int
    public let followingURL: String
    public let gistsURL: String
    public let starredURL: String
    public let eventsURL: String
    public let siteAdmin: Bool
    
    public init(login: String, id: Int, nodeID: String, avatarURL: String, gravatarID: String, url: String, htmlURL: String, followersURL: String, subscriptionsURL: String, organizationsURL: String, reposURL: String, receivedEventsURL: String, type: String, score: Int, followingURL: String, gistsURL: String, starredURL: String, eventsURL: String, siteAdmin: Bool) {
        self.login = login
        self.id = id
        self.nodeID = nodeID
        self.avatarURL = avatarURL
        self.gravatarID = gravatarID
        self.url = url
        self.htmlURL = htmlURL
        self.followersURL = followersURL
        self.subscriptionsURL = subscriptionsURL
        self.organizationsURL = organizationsURL
        self.reposURL = reposURL
        self.receivedEventsURL = receivedEventsURL
        self.type = type
        self.score = score
        self.followingURL = followingURL
        self.gistsURL = gistsURL
        self.starredURL = starredURL
        self.eventsURL = eventsURL
        self.siteAdmin = siteAdmin
    }
    
    public enum CodingKeys: String, CodingKey {
        case login
        case id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case receivedEventsURL = "received_events_url"
        case type
        case score
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case eventsURL = "events_url"
        case siteAdmin = "site_admin"
    }
}


