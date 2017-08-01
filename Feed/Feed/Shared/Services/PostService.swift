//
//  PostService.swift
//  Feed
//
//  Created by Guilherme Endres on 01.08.17.
//  Copyright © 2017 Guilherme Endres. All rights reserved.
//

import Foundation
import Firebase

class PostService {
    
    private let database: Database
    
    init(database: Database = Database.database()) {
        self.database = database
    }
    
    func posts(completion: @escaping (_ posts: [Post]) -> Void) {
        let postReference = database.reference(withPath: "post")
        postReference.observe(.value, with: { snapshot in
            
            var posts: [Post] = []
            
            for item in snapshot.children {
                guard
                    let snapshot = item as? DataSnapshot,
                    let dictionary = snapshot.value as? Dictionary<String, Any> else { return }
                posts.append(Post(dictionary: dictionary))
            }
            
            completion(posts)
        })
    }
}
