//
//  AppDelegate.swift
//  Feed
//
//  Created by Guilherme Endres on 26.07.17.
//  Copyright © 2017 Guilherme Endres. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootRouter: RootRouter?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        rootRouter = RootRouter()
        rootRouter?.makeModule(inWindow: window!)
        
        return true
    }
}

