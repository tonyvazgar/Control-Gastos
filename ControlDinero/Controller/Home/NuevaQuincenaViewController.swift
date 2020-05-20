//
//  NuevaQuincenaViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 19/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class NuevaQuincenaViewController: UIViewController {

    @IBOutlet weak var agregarButton: UIButton!
    @IBAction func agregarAction(_ sender: UIButton) {
        sender.shine()
        sender.jump()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        agregarButton.round()
    }
    

}
