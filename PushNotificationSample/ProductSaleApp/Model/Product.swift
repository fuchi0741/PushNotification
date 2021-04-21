//
//  Product.swift
//  PushNotificationSample
//
//  Created by 渕一真 on 2021/04/20.
//

import Foundation

struct Product {
    let title: String
    let cost: Double
    
    var price: String {
        let costString = String(format: "%.2f", cost)
         return "¥" + costString
    }
}
