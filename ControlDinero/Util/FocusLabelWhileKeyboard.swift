//
//  FocusLabelWhileKeyboard.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 31/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
