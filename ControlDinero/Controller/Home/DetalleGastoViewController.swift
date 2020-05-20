//
//  DetalleGastoViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 19/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class DetalleGastoViewController: UIViewController {

    @IBOutlet weak var nombreGastoLabel: UILabel!
    
    var nombre: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombreGastoLabel.text = nombre
    }
    

}
