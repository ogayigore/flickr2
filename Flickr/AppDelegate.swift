//
//  AppDelegate.swift
//  Flickr
//
//  Created by Игорь Огай on 15.02.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let coordinator = CoordinatorAssembly().coordinator


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        coordinator.window = window
        coordinator.start()
        return true
    }


}

