//
//  DetalleQuincenaViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 19/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class DetalleQuincenaViewController: UIViewController {

    @IBOutlet weak var mesLabel: UILabel!
    @IBOutlet weak var num_quincena_label: UILabel!
    @IBOutlet weak var monto_label: UILabel!
    @IBOutlet weak var fecha_label: UILabel!
    @IBOutlet weak var detalles_label: UILabel!
    
    var mes: String = ""
    var num_quincena: String = ""
    var amount: String = ""
    var fecha: String = ""
    var detalles: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mesLabel.text = mes
        num_quincena_label.text = num_quincena
        monto_label.text = numberFormated(number: Double(amount)!)
        fecha_label.text = fecha
        detalles_label.text = detalles
        
    }
    

}
