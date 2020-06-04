//
//  Functions.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 24/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import Foundation

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
    formatter.dateFormat = "dd.MM.yyyy"
    let result = formatter.string(from: date)
    return result
}

func dateToMyString(date: Date) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "dd-MM-yyyy"
    let result = formatter.string(from: date)
    return result
}
