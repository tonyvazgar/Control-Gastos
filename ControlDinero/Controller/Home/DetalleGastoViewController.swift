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
    @IBOutlet weak var fechaLabel: UILabel!
    @IBOutlet weak var detallesLabel: UILabel!
    @IBOutlet weak var montoLabel: UILabel!
    
    var nombre      : String = ""
    var fecha       : String = ""
    var detalles    : String = ""
    var monto       : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombreGastoLabel.text   = nombre
        fechaLabel.text         = detalles
        detallesLabel.text      = fecha
        montoLabel.text         = numberFormated(number: Double(monto)!)
    }
    

}
