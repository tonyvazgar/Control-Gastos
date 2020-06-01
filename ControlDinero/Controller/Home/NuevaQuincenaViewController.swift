//
//  NuevaQuincenaViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 19/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class NuevaQuincenaViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var agregarButton: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var montoTextField: UITextField!
    @IBOutlet weak var detallesTextField: UITextField!
    
    let pickerDataNumQuincenas = ["","1", "2", "3", "4"]
    var numero_quincena = ""
    
    @IBAction func agregarAction(_ sender: UIButton) {
        if montoTextField.text != "" && detallesTextField.text != "" {
            if self.numero_quincena != "0" && self.numero_quincena != "" {
                insetar(un_mes: getCurrentDate(), una_num_quincena: self.numero_quincena, una_fecha: getTodayDate(), unos_detalles: detallesTextField.text!, un_monto: montoTextField.text!)
                navigationController?.popViewController(animated: true)
                dismiss(animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(title: "Falta el número de quincena", message: "Debes seleccionar el número de quincena para agregarla", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }
        } else {
            let alertController = UIAlertController(title: "Campos vacios", message: "Debes llenar campos de descripción y el monto", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    private func insetar(un_mes: String, una_num_quincena: String, una_fecha: String, unos_detalles: String, un_monto: String){
        Model.insertIntoIngreso(mes: un_mes, num_quincena: una_num_quincena, fecha: una_fecha, detalles: unos_detalles, monto: un_monto)
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
    }
    override func viewWillDisappear(_ animated: Bool) {
        Model.selectAllIngresos()
    }
    
    // MARK: Implementaciones
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
    
    @objc func keyboardWillHide(notification: NSNotification){
        self.view.frame.origin.y = 0
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
