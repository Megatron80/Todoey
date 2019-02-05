//
//  AppDelegate.swift
//  Todoey
//
//  Created by Scott Cowie on 12/3/18.
//  Copyright © 2018 Scott Cowie. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        
        do {
            _ = try Realm()
            } catch {
                print("Error Initializing realm \(error)")
            }
        
        return true
    }




}
