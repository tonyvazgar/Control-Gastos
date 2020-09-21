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
        let defaultTimeReminder = "15:00"
        setHoraDatePicker(hora: defaultTimeReminder)
    }
    
    @IBAction func setButtonAction(_ sender: Any) {
        let dateFormatter = DateFormatter()

        dateFormatter.timeStyle = DateFormatter.Style.short
        
        dateFormatter.amSymbol = ""
        dateFormatter.pmSymbol = ""
        dateFormatter.locale = Locale(identifier: "en_US")
        
        dateFormatter.dateFormat = "HH:mm"
        let hours = dateFormatter.string(from: timePiccker.date)
        
        deleteHourReminder()
        saveHourReminder(hour: hours)
        scheduleNotification()
        
        self.presentingViewController?.dismiss(animated: true, completion: {
            let alert = UIAlertController(title: Text.tituloAlertNotificacion, message: Text.mensajeAlertNotificacion + hours, preferredStyle: .alert)
            let alertButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(alertButton)
            UIApplication.getTopMostViewController()?.present(alert, animated: true, completion: nil)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGroupedBackground
        self.isModalInPresentation = true

        let hora_from_db = getHourReminder()
        setHoraDatePicker(hora: hora_from_db)

    
        defaultButton.bounce()
        defaultButton.round()
        
        setButton.round()
        setButton.bounce()
    }
    
    func setHoraDatePicker(hora: String) {
        
        let dateFormatter = DateFormatter()

        dateFormatter.timeStyle = DateFormatter.Style.short
        
        dateFormatter.amSymbol = ""
        dateFormatter.pmSymbol = ""
        dateFormatter.locale = Locale(identifier: "en_US")
        
        dateFormatter.dateFormat = "HH:mm"
        
        let date = dateFormatter.date(from: hora)
        timePiccker.date = date!
    }
}
extension UIApplication {

    class func getTopMostViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        } else {
            return nil
        }
    }
}
