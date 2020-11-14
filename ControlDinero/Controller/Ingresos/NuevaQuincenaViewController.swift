//
//  NuevaQuincenaViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 19/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class NuevaQuincenaViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: Declaración de UI elements
    @IBOutlet weak var agregarButton: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var montoTextField: CurrencyField!
    @IBOutlet weak var detallesTextField: UITextField!
    let pickerDataNumQuincenas = ["","1", "2", "3", "4"]
    var numero_quincena = ""
    
    // MARK: Actions
    @IBAction func agregarAction(_ sender: UIButton) {
        if montoTextField.decimal != 0.0 && detallesTextField.text != "" {
            if self.numero_quincena != "0" && self.numero_quincena != "" {
                insetar(un_mes: getCurrentDate(), una_num_quincena: self.numero_quincena, una_fecha: getTodayDate(), unos_detalles: detallesTextField.text!, un_monto: String(describing: montoTextField.decimal))
                navigationController?.popViewController(animated: true)
                dismiss(animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(title: Text.misIngresosTitleNumQuincena, message: Text.misIngresosMessageNumQuincena, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }
        } else {
            let alertController = UIAlertController(title: Text.misIngresosTitleAlertVacio, message: Text.misIngresosMessageAlertVacio, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Connect data:
        self.picker.delegate = self
        self.picker.dataSource = self
        self.dismissKey()
        agregarButton.round()
        
        //Para notificar que tiene que empujar vista cuando aparece el teclado
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        

        let currentLanguaje = Locale.preferredLanguages[0]
//        montoTextField.addTarget(self, action: #selector(currencyFieldChanged), for: .editingChanged)
        montoTextField.locale = Locale(identifier: currentLanguaje) // or "en_US", "fr_FR", etc
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Model.selectAllIngresosReverseWhere(mes: getCurrentDate())
    }
    
    // MARK: Implementaciones PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataNumQuincenas.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (pickerDataNumQuincenas[row])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numero_quincena = pickerDataNumQuincenas[row]
    }
    
    // MARK: Funciones de ObjectiveC para mostrar o ocultar keyboard cuando se escribe en labels
    @objc func keyboardWillShow(notification: NSNotification){
        self.view.frame.origin.y = 0
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y -= keyboardSize.height
        }
    }
    
    @objc func currencyFieldChanged() {
        print("currencyField:",montoTextField.text!)
        print("decimal:", montoTextField.decimal)
        print("doubleValue:",(montoTextField.decimal as NSDecimalNumber).doubleValue, terminator: "\n\n")
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        self.view.frame.origin.y = 0
    }
    
    
    // MARK: Funciones privadas
    private func insetar(un_mes: String, una_num_quincena: String, una_fecha: String, unos_detalles: String, un_monto: String){
        Model.insertIntoIngreso(mes: un_mes, num_quincena: una_num_quincena, fecha: una_fecha, detalles: unos_detalles, monto: un_monto)
    }
}

// MARK: Extensions
extension UIViewController {
    func dismissKey() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
        
    }
}
