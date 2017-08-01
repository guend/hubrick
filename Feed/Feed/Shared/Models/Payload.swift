//
//  Payload.swift
//  Feed
//
//  Created by Guilherme Endres on 01.08.17.
//  Copyright © 2017 Guilherme Endres. All rights reserved.
//

import Foundation

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
