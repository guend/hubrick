//
//  RootRouter.swift
//  Feed
//
//  Created by Guilherme Endres on 26.07.17.
//  Copyright © 2017 Guilherme Endres. All rights reserved.
//

import Foundation
import UIKit

class RootRouter {
    func makeModule(inWindow window: UIWindow) {
        window.makeKeyAndVisible()
        let navigationController = UINavigationController(
            rootViewController: FeedRouter.makeModule())
        navigationController.navigationBar.isTranslucent = true
        window.rootViewController = navigationController
    }
}
