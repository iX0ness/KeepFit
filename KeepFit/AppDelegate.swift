//
//  AppDelegate.swift
//  KeepFit
//
//  Created by Levchuk Misha on 15.02.2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        loadDatabase()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

//    private func saveDataToDatabase() {
//        let thruster = Exercise(name: "Thruster", imagePath: UIImage(named: "thruster")?.saveInLocalStorage(imageName: "Thruster") ?? "")
//        let snatch = Exercise(name: "Snatch", imagePath: UIImage(named: "snatch")?.saveInLocalStorage(imageName: "Snatch") ?? "")
//        let ringdip = Exercise(name: "Ringdip", imagePath: UIImage(named: "ringdip")?.saveInLocalStorage(imageName: "Ringdip") ?? "")
//        let burpee = Exercise(name: "Burpee", imagePath: UIImage(named: "burpee")?.saveInLocalStorage(imageName: "Burpee") ?? "")
//
//        DBManager.sharedInstance.saveObjectInDB(thruster, completion: {
//            print("Thruster successfully added to DB")
//
//        }) { (error) in
//            print(error)
//        }
//
//        DBManager.sharedInstance.saveObjectInDB(snatch, completion: {
//            print("Snatch successfully added to DB")
//
//        }) { (error) in
//            print(error)
//        }
//
//        DBManager.sharedInstance.saveObjectInDB(ringdip, completion: {
//            print("Ringdip successfully added to DB")
//
//        }) { (error) in
//            print(error)
//        }
//
//        DBManager.sharedInstance.saveObjectInDB(burpee, completion: {
//            print("Burpee successfully added to DB")
//
//        }) { (error) in
//            print(error)
//        }
//    }


    private func loadDatabase() {
        let thruster = Exercise(name: "Thruster", imagePath: UIImage(named: "thruster")?.saveInLocalStorage(imageName: "Thruster") ?? "")
        let snatch = Exercise(name: "Snatch", imagePath: UIImage(named: "snatch")?.saveInLocalStorage(imageName: "Snatch") ?? "")
        let ringdip = Exercise(name: "Ringdip", imagePath: UIImage(named: "ringdip")?.saveInLocalStorage(imageName: "Ringdip") ?? "")
        let burpee = Exercise(name: "Burpee", imagePath: UIImage(named: "burpee")?.saveInLocalStorage(imageName: "Burpee") ?? "")

        DBManager.sharedInstance.populateDB(thruster)
        DBManager.sharedInstance.populateDB(snatch)
        DBManager.sharedInstance.populateDB(ringdip)
        DBManager.sharedInstance.populateDB(burpee)

    }


}

