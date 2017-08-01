//
//  Post.swift
//  Feed
//
//  Created by Guilherme Endres on 01.08.17.
//  Copyright © 2017 Guilherme Endres. All rights reserved.
//

import Foundation

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
