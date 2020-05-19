//
//  UIButtonExtension.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 18/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

private let orange = UIColor(red: 254/255, green: 148/255, blue: 0/255, alpha: 1 )

extension UIButton {
    
    // MARK: Borde redondo
    func round() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    // MARK:  Rebote
    func bounce() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = .identity
            })
        }
    }
    
    // MARK:  Brilla
    func shine() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }
    
    // MARK:  Salta
    func jump() {
        UIView.animate(withDuration: 1, animations: {
            self.transform = CGAffineTransform(translationX: 0, y: -10)
        }) { (completion) in
            UIView.animate(withDuration: 1, animations: {
                self.transform = .identity
            })
        }
    }
    
    func selectOperation(_ selected: Bool){
        backgroundColor = selected ? .white: orange
        setTitleColor(selected ? orange: .white, for: .normal)
    }
    
}
