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
    
    let pickerData = ["1", "2", "3", "4"]
    
    @IBAction func agregarAction(_ sender: UIButton) {
        sender.shine()
        sender.jump()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Connect data:
        self.picker.delegate = self
        self.picker.dataSource = self
        
        agregarButton.round()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (pickerData[row])
    }
    
}
