//
//  AppDelegate.swift
//  InstagramFollowersManager
//
//  Created by Ирина Кольчугина on 16.05.2024.
//

import UIKit
import FBSDKCoreKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate { 

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        return FBSDKApplicationDelegate
            .sharedInstance()
            .application(
                app,
                open: url,
                options: options)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FBSDKApplicationDelegate
            .sharedInstance()
            .application(
                application,
                didFinishLaunchingWithOptions: launchOptions)
        return true
    }
}

