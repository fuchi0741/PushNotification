//
//  UNService.swift
//  PushNotificationSample
//
//  Created by æ¸ä¸ç on 2021/04/21.
//

import UIKit
import UserNotifications

class UNService: NSObject {
    
    private override init() {}
    static let shared = UNService()
    
    let unCenter = UNUserNotificationCenter.current()
    
    func authorize() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        unCenter.requestAuthorization(options: options) { (granded, error) in
            guard granded else {
                print("ð¡è¨±å¯ãããªãã£ãã")
                return
            }
            
            DispatchQueue.main.async {
                self.configure()
            }
        }
    }
    
    func configure() {
        unCenter.delegate = self
        
        let application = UIApplication.shared
        //ãªã¢ã¼ãéç¥ãåãåãããã«å¿è¦
        application.registerForRemoteNotifications()
    }
}

extension UNService: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("ð¡éç¥ãåãåã£ãã")
        completionHandler()
    }

    //ã¢ããªãFGã«ããå ´åã®ã¿çºå
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        let oprions: UNNotificationPresentationOptions = [.alert, .sound]
        completionHandler(oprions)
    }
}
