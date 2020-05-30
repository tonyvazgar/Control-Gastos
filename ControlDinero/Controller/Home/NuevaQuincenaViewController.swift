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
//        print(numero_quincena)
//        print(montoTextField.text!)
//        print(detallesTextField.text!)
        insetar()
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    private func insetar(){
        let un_mes = getCurrentDate()
        let una_num_quincena = self.numero_quincena
        let una_fecha = getTodayDate()
        let unos_detalles = detallesTextField.text!
        let un_monto = montoTextField.text!
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
