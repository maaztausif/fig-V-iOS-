//
//  CommonFunction.swift
//  Fig-C
//
//  Created by maaz tausif on 20/02/2022.
//

import Foundation
import UIKit
extension UIColor{

/// Converting hex string to UIColor
///
/// - Parameter hexString: input hex string
convenience init(hexString: String) {
    let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int = UInt64()
    Scanner(string: hex).scanHexInt64(&int)
    let a, r, g, b: UInt64
    switch hex.count {
    case 3:
        (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6:
        (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8:
        (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
        (a, r, g, b) = (255, 0, 0, 0)
    }
    self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
}
}
func for_Notification(title:String?,body:String?,date:Date?){
    let content = UNMutableNotificationContent()
    content.title = title ?? ""
    content.body = body ?? ""
    print(content.body)
    content.subtitle = "Reminder!!"
    content.sound = UNNotificationSound.default
//    print(user_Date!)
    let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date ?? .now) //log ▿ year: 2018 month: 10 day: 20 hour: 18 minute: 11 second: 0 isLeapMonth: false
    let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
        if let error = error {
            // Something went wrong
            print(error)
        }else{
            print("succes")
        }
    })

}
