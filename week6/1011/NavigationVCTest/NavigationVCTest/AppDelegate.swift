//
//  AppDelegate.swift
//  NavigationVCTest
//
//  Created by 심 승민 on 2017. 10. 11..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // window는 옵셔널이다. 즉, 존재하지 않을 수도 있으므로 직접 만들어줘야 함
        // 또한, 프레임을 줄 때 기존처럼 RootView를 사용할 수도 없다.(VC가 없으므로) -> Screen 자체를 가져와야
        /*
        // window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // ViewController Instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // Navigation VC의 맨 처음(루트) VC로 설정할 아이~
        let rootVC: ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        // rootVC를 Navigation VC의 루트로 설정
        let naviVC = UINavigationController(rootViewController: rootVC)
        
        window?.rootViewController = naviVC
        // window도 여러 개 만들 수 있음. 가장 메인이 되는 윈도우가 key window
        window?.makeKeyAndVisible()
        */
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


}

