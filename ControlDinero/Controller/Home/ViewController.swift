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
        var texto: String
        Model.selectAllIngresos()
        texto = ""
        for ingreso in Model.ingresosList{
            texto += " ID: \(ingreso.monto)"
        }
        return texto
    }
    
    private func getGastos() -> String {
        var gastos = "$10,000.33"
        /*
         *Code
         */

        return gastos
    }
    
    private func getTotal() -> String {
        var total = "$23,204.00"
        /*
         *Code
         */

        return total
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createDB()
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

    //MARK: Funciones DB
    private func createDB(){
        Model.createDB("develop")
        Model.openDB()
        Model.execute("CREATE TABLE Quincena (id_quincena INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, mes TEXT NOT NULL, num_quincena INTEGER NOT NULL, fecha TEXT NOT NULL, detalles TEXT NOT NULL, monto REAL NOT NULL)")
        Model.execute("CREATE TABLE Gasto (id_gasto INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, nombre TEXT NOT NULL, detalles TEXT NOT NULL, fecha TEXT NOT NULL, monto REAL NOT NULL)")
        Model.execute("CREATE TABLE Total (mes TEXT NOT NULL, ingresos REAL NOT NULL, egresos REAL NOT NULL, num_de_quincenas INTEGER NOT NULL, num_de_gastos INTEGER NOT NULL, total REAL NOT NULL)")
        
    }

}

