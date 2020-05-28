//
//  Functions.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 24/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import Foundation

func getCurrentDate() -> String {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.dateFormat = "MMMM yyyy"
    let result = formatter.string(from: date)
    return result
}

func getTodayDate() -> String{
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "dd.MM.yyyy"
    let result = formatter.string(from: date)
    return result
}
