//
//  AppDelegate.swift
//  茄子
//
//  Created by jake on 16/3/8.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window?.backgroundColor = UIColor.whiteColor()
        let root: UITabBarController = UITabBarController.init()
        let home: UINavigationController = UINavigationController.init(rootViewController: Main.init())
        let image1: UIImage = UIImage.init(named: "default")!
        let item1 : UITabBarItem = UITabBarItem.init(title: "主页", image: image1.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: image1.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        home.tabBarItem = item1
        let activity: UINavigationController = UINavigationController.init(rootViewController: Activity.init())
        let image2: UIImage = UIImage.init(named: "default")!
        let item2 : UITabBarItem = UITabBarItem.init(title: "活动", image: image2.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: image2.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        activity.tabBarItem = item2
        let mypai: UINavigationController = UINavigationController.init(rootViewController: Mypai.init())
        let image3: UIImage = UIImage.init(named: "default")!
        let item3 : UITabBarItem = UITabBarItem.init(title: "我要拍", image: image3.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: image3.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        mypai.tabBarItem = item3
        let message: UINavigationController = UINavigationController.init(rootViewController: Message.init())
        let image4: UIImage = UIImage.init(named: "default")!
        let item4: UITabBarItem = UITabBarItem.init(title: "消息", image: image4.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: image4.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
         message.tabBarItem = item4
        let mine: UINavigationController = UINavigationController.init(rootViewController: Mine.init())
        let image5: UIImage = UIImage.init(named: "default")!
        let item5 : UITabBarItem = UITabBarItem.init(title: "我", image: image5.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: image5.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        mine.tabBarItem = item5
        root.tabBar.barTintColor = UIColor.blackColor()
        root.viewControllers = [home,activity,mypai,message,mine]
        self.window?.rootViewController = root
        
        
                return true
    }

   
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

