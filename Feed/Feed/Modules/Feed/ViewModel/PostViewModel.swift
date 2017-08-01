//
//  PostViewModel.swift
//  Feed
//
//  Created by Guilherme Endres on 01.08.17.
//  Copyright © 2017 Guilherme Endres. All rights reserved.
//

import Foundation

struct PostViewModel {
    let authorImageUrl: URL?
    let displayName: String
    let time: String
    let imageUrl: URL?
    let title: String
    let description: String
    let likesCount: String
    let commentsCount: String
    let shareCount: String
}
