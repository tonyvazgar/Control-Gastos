//
//  QuincenasViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 18/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class QuincenasViewController: UIViewController {

    @IBOutlet weak var nuevaQuincenaButton: UIButton!
    
    @IBAction func nuevaQuincenaAction(_ sender: UIButton) {
        sender.shine()
        sender.jump()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nuevaQuincenaButton.titleLabel?.textAlignment = .center
        nuevaQuincenaButton.round()
    }
    

}
