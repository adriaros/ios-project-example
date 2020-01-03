//
//  main.swift
//  ios-project-example
//
//  Created by Adrià Ros on 28/12/2019.
//  Copyright © 2019 adriaros. All rights reserved.
//

import Foundation
import UIKit

///This File (main.swift) is the responsible of switching the appDelegate depending on debug, release or test mode. This is the first module to be executed
class TestingAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? ) -> Bool {
        self.window?.rootViewController = UIViewController()
        return true
    }
}

let isRunningTests = ProcessInfo.processInfo.environment["UNIT_TESTS"] != nil
let appDelegateClass = isRunningTests ? NSStringFromClass(TestingAppDelegate.self) : NSStringFromClass(AppDelegate.self)
UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, appDelegateClass)
