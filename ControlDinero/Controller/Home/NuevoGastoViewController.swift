//
//  NuevoGastoViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 19/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class NuevoGastoViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var montoTextField: UITextField!
    @IBOutlet weak var detallesTextField: UITextField!
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var agregarButton: UIButton!
    
    
    @IBAction func agregarAction(_ sender: UIButton) {
        sender.shine()
        sender.jump()
        
        if montoTextField.text != "" && detallesTextField.text != "" && nombreTextField.text != ""{
            insetar(nombre: nombreTextField.text!, detalles: detallesTextField.text!, fecha: dateToMyString(date: datePicker.date), monto: montoTextField.text!)
                navigationController?.popViewController(animated: true)
                dismiss(animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Campos vacios", message: "Debes llenar campos de nombre, detalles y el monto.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func insetar(nombre: String, detalles: String, fecha: String, monto: String){
        Model.insertIntoGasto(nombre: nombre, detalles: detalles, fecha: fecha, monto: monto)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        agregarButton.round()
        self.dismissKey()
        
        //Para notificar que tiene que empujar vista cuando aparece el teclado
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        Model.selectAllEgresos()
    }
    
    // MARK: Funciones de ObjectiveC para mostrar o ocultar keyboard cuando se escribe en labels
    
    @objc func keyboardWillShow(notification: NSNotification) {
        self.view.frame.origin.y = 0
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y -= keyboardSize.height
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
}
