//
//  UNService.swift
//  PushNotificationSample
//
//  Created by 渕一真 on 2021/04/21.
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
                print("💡許可されなかったよ")
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
        //リモート通知を受け取るために必要
        application.registerForRemoteNotifications()
    }
}

extension UNService: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("💡通知を受け取ったよ")
        completionHandler()
    }

    //アプリがFGにいる場合のみ発動
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        let oprions: UNNotificationPresentationOptions = [.alert, .sound]
        completionHandler(oprions)
    }
}
