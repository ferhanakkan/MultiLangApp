//
//  AppDelegate.swift
//  MultiLanguageApp
//
//  Created by Ferhan Akkan on 4.04.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import UIKit
import Localize

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Localize.shared.update(provider: .json)
        Localize.shared.update(fileName: "language")
        Localize.shared.update(defaultLanguage: "en")
        
        let userDefaults = UserDefaults.standard
        let lang = Locale.preferredLanguages[0]
        
        if userDefaults.value(forKey: "lang") == nil {
            switch lang{
            case "en-TR":
                Localize.update(language: "en")
                userDefaults.set("en", forKey: "lang")
            case "tr-TR":
                Localize.update(language: "tr")
                userDefaults.set("tr", forKey: "lang")
            default:
                Localize.update(language: "en")
                userDefaults.set("en", forKey: "lang")
            }
            userDefaults.synchronize()
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

