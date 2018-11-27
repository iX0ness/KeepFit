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

    private func loadDatabase() {
        let thruster = Exercise(name: "Thruster", imagePath: UIImage(named: "thruster")?.saveInLocalStorage(imageName: "Thruster") ?? "")
        let snatch = Exercise(name: "Snatch", imagePath: UIImage(named: "snatch")?.saveInLocalStorage(imageName: "Snatch") ?? "")
        let ringdip = Exercise(name: "Ringdip", imagePath: UIImage(named: "ringdip")?.saveInLocalStorage(imageName: "Ringdip") ?? "")
        let burpee = Exercise(name: "Burpee", imagePath: UIImage(named: "burpee")?.saveInLocalStorage(imageName: "Burpee") ?? "")
        let running = Exercise(name: "Running", imagePath: UIImage(named: "running")?.saveInLocalStorage(imageName: "Running") ?? "")
        let backsquat = Exercise(name: "Back Squat", imagePath: UIImage(named: "backsquat")?.saveInLocalStorage(imageName: "BackSquat") ?? "")
        let frontsquat = Exercise(name: "Front Squat", imagePath: UIImage(named: "frontsquat")?.saveInLocalStorage(imageName: "FrontSquat") ?? "")
        let cleanjerk = Exercise(name: "Clean&Jerk", imagePath: UIImage(named: "cleanjerk")?.saveInLocalStorage(imageName: "CleanJerk") ?? "")
        let clean = Exercise(name: "Clean", imagePath: UIImage(named: "clean")?.saveInLocalStorage(imageName: "Clean") ?? "")
        let pushPress = Exercise(name: "Push Press", imagePath: UIImage(named: "pushpress")?.saveInLocalStorage(imageName: "PushPress") ?? "")
        let jerk = Exercise(name: "Jerk", imagePath: UIImage(named: "jerk")?.saveInLocalStorage(imageName: "Jerk") ?? "")
        let pushUp = Exercise(name: "Push Up", imagePath: UIImage(named: "pushup")?.saveInLocalStorage(imageName: "PushUp") ?? "")
        let pullUp = Exercise(name: "Pull Up", imagePath: UIImage(named: "pullup")?.saveInLocalStorage(imageName: "PullUp") ?? "")
        let muscleUP = Exercise(name: "Muscle Up", imagePath: UIImage(named: "muscleup")?.saveInLocalStorage(imageName: "MuscleUp") ?? "")
        let benchPress = Exercise(name: "Bench Press", imagePath: UIImage(named: "benchpress")?.saveInLocalStorage(imageName: "BenchPress") ?? "")
        
        

        DBManager.sharedInstance.populateDB(thruster)
        DBManager.sharedInstance.populateDB(snatch)
        DBManager.sharedInstance.populateDB(ringdip)
        DBManager.sharedInstance.populateDB(burpee)
        DBManager.sharedInstance.populateDB(running)
        DBManager.sharedInstance.populateDB(backsquat)
        DBManager.sharedInstance.populateDB(frontsquat)
        DBManager.sharedInstance.populateDB(cleanjerk)
        DBManager.sharedInstance.populateDB(clean)
        DBManager.sharedInstance.populateDB(pushPress)
        DBManager.sharedInstance.populateDB(jerk)
        DBManager.sharedInstance.populateDB(pushUp)
        DBManager.sharedInstance.populateDB(pullUp)
        DBManager.sharedInstance.populateDB(muscleUP)
        DBManager.sharedInstance.populateDB(benchPress)



        
        

    }


}

