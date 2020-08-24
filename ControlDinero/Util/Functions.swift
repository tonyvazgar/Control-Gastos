//
//  Functions.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 24/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import Foundation

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
    print(priceString) // Displays $9,999.99 in the US locale
    return priceString
}
