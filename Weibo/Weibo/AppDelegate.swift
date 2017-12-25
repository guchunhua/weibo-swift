//
//  AppDelegate.swift
//  Weibo
//
//  Created by 顾春华 on 2017/12/22.
//  Copyright © 2017年 leslie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        sleep(1)
        window = UIWindow()
        
        window?.backgroundColor = .white
        window?.rootViewController = LEMainViewController()
        window?.makeKeyAndVisible()
        return true
    }



}

