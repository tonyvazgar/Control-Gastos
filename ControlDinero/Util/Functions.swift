//
//  Functions.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 24/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import Foundation
import Device

let myKey = "reminderHour"

func saveHourReminder(hour: String) {
    UserDefaults.standard.set(hour, forKey: myKey)
    UserDefaults.standard.synchronize()
}

func deleteHourReminder() {
    UserDefaults.standard.removeObject(forKey: myKey)
    UserDefaults.standard.synchronize()
}

func getHourReminder() -> String {
    if let hour = UserDefaults.standard.object(forKey: myKey) {
        return hour as! String
    } else {
        return ""
    }
}

func scheduleNotification() {
    
//    center.removeAllPendingNotificationRequests()
//    
    let content = UNMutableNotificationContent()
        
    content.title = Text.tituloNotificacion
    content.body  = Text.bodyNotificacion
    content.categoryIdentifier = "alarm"
    content.userInfo = ["customData": "perris"]
    content.sound = .default
            
    var dateComponents = DateComponents()
            
    let hora_recordatorio = getHourReminder()
    
    dateComponents.hour   = Int(hora_recordatorio.prefix(2))
    dateComponents.minute = Int(hora_recordatorio.suffix(2))
            
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request)
}

func getDeviceLanguage() -> String! {
    return NSLocale.current.languageCode
}

func getCurrentDate() -> String {
    let currentLanguaje = Locale.preferredLanguages[0]
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: currentLanguaje)
    dateFormatter.dateFormat = "MMMM yyyy"
    let stringDate = (dateFormatter.string(from: Date())).capitalizingFirstLetter()
    return stringDate
}

func getTodayDate() -> String{
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "dd-MM-yyyy"
    let result = formatter.string(from: date)
    return result
}

func dateToMyString(date: Date) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "dd-MM-yyyy"
    let result = formatter.string(from: date)
    return result
}

func numberFormated(number: Double) -> String{
    let currencyFormatter = NumberFormatter()
    currencyFormatter.usesGroupingSeparator = true
    currencyFormatter.numberStyle = .currency
    // localize to your grouping and decimal separator
    currencyFormatter.locale = Locale.current

    // We'll force unwrap with the !, if you've got defined data you may need more error checking
    let priceString = currencyFormatter.string(from: NSNumber(value: number))!
//    print(priceString) // Displays $9,999.99 in the US locale
    return priceString
}
