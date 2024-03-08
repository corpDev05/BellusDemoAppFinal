//
//  NotificationHandler.swift
//  DemoApp
//
//  Created by Devesh Pandey on 08/03/24.
//  Copyright © 2024 Bellubis-WS29. All rights reserved.
//
import Foundation
import UserNotifications

class NotificatioHandler{
    
    static func dispatchNotification(_ time:(hour:Int,minute:Int,second:Int),_ title:String,_ body:String,_ isDaily:Bool) -> Void {
        let identifier = UUID().uuidString
        
        let notificationCenter = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.sound = .default
        content.title = title
        content.body = body
        let calendar = Calendar.current
        var dateComponent = DateComponents(calendar: calendar,timeZone: TimeZone.current)
        dateComponent.hour = time.hour
        dateComponent.minute = time.minute
        dateComponent.second  = time.second
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
        
        
        
        
    }
    
}
