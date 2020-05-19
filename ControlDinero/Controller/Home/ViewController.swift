//
//  ViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 17/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Declaración de variables
    @IBOutlet weak var labelMes: UILabel!
    @IBOutlet weak var labelGanancias: UILabel!
    @IBOutlet weak var labelGastos: UILabel!
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var quincenasButton: UIButton!
    @IBOutlet weak var gastosButton: UIButton!
    
    // MARK: Actions
    @IBAction func buttonQuincenas(_ sender: UIButton) {
        sender.shine()
        sender.jump()
    }
    
    @IBAction func buttonGastos(_ sender: UIButton) {
        sender.shine()
        sender.jump()
    }
    
    // MARK: Funciones
    private func getCurrentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.dateFormat = "MMMM yyyy"
        let result = formatter.string(from: date)
        return result
    }
    
    private func getGanancias() -> String {
        var ganancias = "$33,204.33"
        return ganancias
    }
    
    private func getGastos() -> String {
        var gastos = "$10,000.33"
        return gastos
    }
    
    private func getTotal() -> String {
        var total = "$23,204.00"
        return total
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        quincenasButton.round()
        quincenasButton.bounce()
        quincenasButton.jump()
        gastosButton.round()
        gastosButton.jump()
        gastosButton.bounce()
        
        //Obtener datos para poner en labels
        labelMes.text = getCurrentDate()
        labelGastos.text = getGastos()
        labelGanancias.text = getGanancias()
        labelTotal.text = getTotal()
    }


}

