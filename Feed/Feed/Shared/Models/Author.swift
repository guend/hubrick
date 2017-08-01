//
//  Author.swift
//  Feed
//
//  Created by Guilherme Endres on 01.08.17.
//  Copyright © 2017 Guilherme Endres. All rights reserved.
//

import Foundation

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
