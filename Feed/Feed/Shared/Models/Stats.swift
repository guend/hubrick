//
//  Stats.swift
//  Feed
//
//  Created by Guilherme Endres on 01.08.17.
//  Copyright © 2017 Guilherme Endres. All rights reserved.
//

import Foundation

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
