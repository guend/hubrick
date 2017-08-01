//
//  Post.swift
//  Feed
//
//  Created by Guilherme Endres on 01.08.17.
//  Copyright © 2017 Guilherme Endres. All rights reserved.
//

import Foundation

enum PostType: String {
    case add = "ADD"
}

struct Post {
    let id: String
    let type: PostType
    let author: Author
    let payload: Payload
    
    init(dictionary: Dictionary<String, Any>) {
        id = dictionary["id"] as? String ?? ""
        type = PostType(rawValue: dictionary["type"] as? String ?? "ADD") ?? .add
        author = Author(dictionary: dictionary["author"] as! Dictionary)
        payload = Payload(dictionary: dictionary["payload"] as! Dictionary)
        
    }
}

struct Author {
    let name: String
    let displayName: String
    var avatarImageUrl: URL?
    
    init(dictionary: Dictionary<String, Any>) {
        name = dictionary["name"] as? String ?? ""
        displayName = dictionary["displayName"] as? String ?? ""
        if let avatarImage = dictionary["avatarImage"] as? Dictionary<String, String> {
            avatarImageUrl = URL(string: avatarImage["url"] ?? "")
        }
    }
}

struct Payload {
    let stats: Stats
    let plainTitle: String
    let plainContentPreview: String
    let path: String
    var headlineImageUrl: URL?
    
    init(dictionary: Dictionary<String, Any>) {
        stats = Stats(dictionary: dictionary["stats"] as! Dictionary)
        plainTitle = dictionary["plainTitle"] as? String ?? ""
        plainContentPreview = dictionary["plainContentPreview"] as? String ?? ""
        path = dictionary["path"] as? String ?? ""
        
        guard
            let headLineImage = dictionary["headLineImage"] as? Dictionary<String, String>,
            let urlString = headLineImage["url"] else {
                return
        }
        headlineImageUrl = URL(string: urlString)
    }
}

struct Stats {
    let reactionStats: ReactionStats
    let commentsCount: Int
    
    init(dictionary: Dictionary<String, Any>) {
        reactionStats = ReactionStats(dictionary: dictionary["reactionStats"] as! Dictionary)
        guard let commentsStats = dictionary["commentsStats"] as? Dictionary<String, Int> else {
            commentsCount = 0
            return
        }
        commentsCount = commentsStats["count"] ?? 0
    }
}

struct ReactionStats {
    let likesCount: Int
    let shareCount: Int
    
    init(dictionary: Dictionary<String, Any>) {
        guard let counts = dictionary["counts"] as? Dictionary<String, Int> else {
            likesCount = 0
            shareCount = 0
            return
        }
        likesCount = counts["likesCount"] ?? 0
        shareCount = counts["shareCount"] ?? 0
        
    }
}
