//
//  ReactionStats.swift
//  Feed
//
//  Created by Guilherme Endres on 01.08.17.
//  Copyright © 2017 Guilherme Endres. All rights reserved.
//

import Foundation

struct ReactionStats {
    let likesCount: Int
    let shareCount: Int
    
    init(dictionary: Dictionary<String, Any>) {
        guard let counts = dictionary["counts"] as? Dictionary<String, Int> else {
            likesCount = 0
            shareCount = 0
            return
        }
        likesCount = counts["LIKE"] ?? 0
        shareCount = counts["SHARE"] ?? 0
        
    }
}
