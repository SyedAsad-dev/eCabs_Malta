//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 12/09/2024.
//

import Foundation

// MARK: - GitHubEvent
public struct GitHubEvent: Codable, Hashable {
    public  let id: String?
    public  let type: String?
    public  let actor: MyActor?
    public  let repo: Repo?
    public  let payload: Payload?
    public  let gitHubEventPublic: Bool?
    public  let createdAt: String?

    public enum CodingKeys: String, CodingKey {
         case id, type, actor, repo, payload
         case gitHubEventPublic = "public"
         case createdAt = "created_at"
    }
    
    public init(
        id: String?,
        type: String?,
        actor: MyActor?,
        repo: Repo?,
        payload: Payload?,
        gitHubEventPublic: Bool?,
        createdAt: String?
    ) {
        self.id = id
        self.type = type
        self.actor = actor
        self.repo = repo
        self.payload = payload
        self.gitHubEventPublic = gitHubEventPublic
        self.createdAt = createdAt
    }
    
    // Hashable conformance requires the implementation of hash(into:) method
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // Hashable conformance requires the implementation of == operator
    public static func == (lhs: GitHubEvent, rhs: GitHubEvent) -> Bool {
        return lhs.id == rhs.id
    }
    

}

// MARK: - Actor
public struct MyActor: Codable {
    public let id: Int?
    public let login, displayLogin, gravatarID: String?
    public let url, avatarURL: String?

    public enum CodingKeys: String, CodingKey {
        case id, login
        case displayLogin = "display_login"
        case gravatarID = "gravatar_id"
        case url
        case avatarURL = "avatar_url"
    }
}

// MARK: - Payload
public struct Payload: Codable {
    public let action: String?
    public let pushID, size, distinctSize: Int?
    public let ref, head, before: String?
    public let commits: [Commit]?

    public enum CodingKeys: String, CodingKey {
        case action
        case pushID = "push_id"
        case size
        case distinctSize = "distinct_size"
        case ref, head, before, commits
    }
}

// MARK: - Commit
public struct Commit: Codable {
    public let sha: String?
    public let author: Author?
    public let message: String?
    public let distinct: Bool?
    public let url: String?
}

// MARK: - Author
public struct Author: Codable {
    public let email, name: String?
}

// MARK: - Repo
public struct Repo: Codable {
    public let id: Int?
    public let name: String?
    public let url: String?
}

public typealias GitHubEvents = [GitHubEvent]


