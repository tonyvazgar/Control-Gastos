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
    
    var mes: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mesLabel.text = mes
    }
    

}
