//
//  NuevoGastoViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 29/09/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class NuevoGastoViewController: UIViewController {
    @IBOutlet weak var scollView: UIScrollView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var totalTextField: CurrencyField!
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        
        sender.shine()
        sender.jump()
        
        if totalTextField.decimal != 0.0 && descriptionTextField.text != "" && nameTextField.text != "" {
            
            let name    = nameTextField.text!.capitalizingFirstLetter()
            let details = descriptionTextField.text!
            let date    = dateToMyString(date: datePicker.date)
            let month   = getCurrentDate().capitalizingFirstLetter()
            let amount  = String(describing: totalTextField.decimal)
            
            insetar(nombre: name, detalles: details, fecha: date, mes: month, monto: amount)
            
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: Text.misIngresosTitleAlertVacio, message: Text.misGastosMessageAlertVacio, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButtonOutlet.round()
        self.dismissKey()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let currentLanguaje = Locale.preferredLanguages[0]
        totalTextField.addTarget(self, action: #selector(currencyFieldChanged), for: .editingChanged)
        totalTextField.locale = Locale(identifier: currentLanguaje)
        
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
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scollView.contentInset = contentInset
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scollView.contentInset = contentInset
    }
    @objc func currencyFieldChanged(){
        print("currencyField:",totalTextField.text!)
        print("decimal:", totalTextField.decimal)
        print("doubleValue:",(totalTextField.decimal as NSDecimalNumber).doubleValue, terminator: "\n\n")
    }
    
    
    // MARK: Funciones privadas
    private func insetar(nombre: String, detalles: String, fecha: String, mes: String, monto: String){
        Model.insertIntoGasto(nombre: nombre, detalles: detalles, fecha: fecha, mes: mes,  monto: monto)
    }

}
