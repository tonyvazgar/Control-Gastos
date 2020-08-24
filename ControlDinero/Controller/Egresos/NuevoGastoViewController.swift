//
//  NuevoGastoViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 19/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class NuevoGastoViewController: UIViewController {
    
    // MARK: UI Elements
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var montoTextField: CurrencyField!
    @IBOutlet weak var detallesTextField: UITextField!
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var agregarButton: UIButton!
    
    // MARK: Actions
    @IBAction func agregarAction(_ sender: UIButton) {
        sender.shine()
        sender.jump()
        
        if montoTextField.text != "" && detallesTextField.text != "" && nombreTextField.text != ""{
            
            let name    = nombreTextField.text!.capitalizingFirstLetter()
            let details = detallesTextField.text!
            let date    = dateToMyString(date: datePicker.date)
            let month   = getCurrentDate().capitalizingFirstLetter()
            let amount  = String(describing: montoTextField.decimal)
            
            insetar(nombre: name, detalles: details, fecha: date, mes: month, monto: amount)
            
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: Text.misIngresosTitleAlertVacio, message: Text.misGastosMessageAlertVacio, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    //MARK: Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        agregarButton.round()
        self.dismissKey()
        
        //Para notificar que tiene que empujar vista cuando aparece el teclado
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let currentLanguaje = Locale.preferredLanguages[0]
        montoTextField.addTarget(self, action: #selector(currencyFieldChanged), for: .editingChanged)
        montoTextField.locale = Locale(identifier: currentLanguaje)
        
        datePicker.minimumDate = Calendar.current.dateComponents([.calendar, .year,.month], from: Date()).date!
        
        //Get the max day of the month
        var components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        let range = Calendar.current.range(of: .day, in: .month, for: Date())!
        components.day = range.upperBound - 1
        
        datePicker.maximumDate = Calendar.current.date(from: components)!


    }
    override func viewWillDisappear(_ animated: Bool) {
        Model.selectAllEgresosReverseWhere(mes: getCurrentDate())
    }
    
    
    
    // MARK: Funciones de ObjectiveC para mostrar o ocultar keyboard cuando se escribe en labels
    @objc func keyboardWillShow(notification: NSNotification) {
        self.view.frame.origin.y = 0
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y -= keyboardSize.height
        }
    }
    @objc func currencyFieldChanged(){
        print("currencyField:",montoTextField.text!)
        print("decimal:", montoTextField.decimal)
        print("doubleValue:",(montoTextField.decimal as NSDecimalNumber).doubleValue, terminator: "\n\n")
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    // MARK: Funciones privadas
    private func insetar(nombre: String, detalles: String, fecha: String, mes: String, monto: String){
        Model.insertIntoGasto(nombre: nombre, detalles: detalles, fecha: fecha, mes: mes,  monto: monto)
    }
    
}
