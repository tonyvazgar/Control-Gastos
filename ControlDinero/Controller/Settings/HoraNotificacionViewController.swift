//
//  HoraNotificacionViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 08/09/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class HoraNotificacionViewController: UIViewController {
    
    @IBOutlet weak var timePiccker: UIDatePicker!
    @IBOutlet weak var defaultButton: UIButton!
    @IBOutlet weak var setButton: UIButton!
    
    
    @IBAction func defaultButtonAction(_ sender: Any) {
        
        print("")
        let dateFormatter = DateFormatter()

        dateFormatter.timeStyle = DateFormatter.Style.short
        
        dateFormatter.dateFormat = "HH"
        let hours = dateFormatter.string(from: timePiccker.date)
        print(hours)
        
        dateFormatter.dateFormat = "mm"
        let minutes = dateFormatter.string(from: timePiccker.date)
        print(minutes)
    }
    
    @IBAction func setButtonAction(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGroupedBackground
        

    
        defaultButton.bounce()
        defaultButton.round()
        
        setButton.round()
        setButton.bounce()
    }
}
