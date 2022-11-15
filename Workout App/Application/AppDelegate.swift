//
//  AppDelegate.swift
//  Workout App
//
//  Created by Evgenii Lukin on 06.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let notifications = Notifications()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        notifications.requestAutorization()
        notifications.notificationCenter.delegate = notifications
        return true
    }
}
