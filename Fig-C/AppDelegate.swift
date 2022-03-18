//
//  AppDelegate.swift
//  Fig-C
//
//  Created by maaz tausif on 20/02/2022.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
//        let center = UNUserNotificationCenter.current()
//        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//            
//            if let error = error {
//                // Handle the error here.
//            }
//            
//            // Enable or disable features based on the authorization.
//        }
        
        //MARK: Authorization
            let center = UNUserNotificationCenter.current()
            
            
            //Delegate for UNUserNotificationCenterDelegate
            center.delegate = self
            
            //Permission for request alert, soud and badge
            center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
                // Enable or disable features based on authorization.
                if(!granted){
                    print("not accept authorization")
                }else{
                    print("accept authorization")
                    
                    center.delegate = self
                    
                    
                }
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

    //MARK: For notification
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == UNNotificationDismissActionIdentifier {
            // The user dismissed the notification without taking action
            print("dismisied")
        }
        else if response.actionIdentifier == UNNotificationDefaultActionIdentifier {
            // The user launched the app
            print("launced app")
            let body = response.notification.request.content.body
            let Number = response.notification.request.content.subtitle
//            print(userInfo)
//            MessageApp(phoneNo: Number, message: body)
//            let userInfo = response.notification.request.content.userInfo.values


//            UNUserNotificationCenter.current().delegate = self
            completionHandler()

        }
        
        // Else handle any custom actions. . .
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("yessssssss")
        completionHandler([.alert, .sound])
        

    }
}
