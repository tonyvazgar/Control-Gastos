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
    
    private func getGanancias() -> String {
        var ganancias: Double
        Model.selectAllIngresos()
        ganancias = 0.0
        for ingreso in Model.ingresosList{
            let quincena = Double(ingreso.monto)
            print(ingreso.description)
            ganancias += quincena
        }
        let total = "$\(String(describing: ganancias))"
        return total
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
        Model.selectAllIngresos()
        labelGanancias.reloadInputViews()
        print("HOla amikoooosssssss****")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        labelGanancias.reloadInputViews()
        Model.selectAllIngresos()
        //Obtener datos para poner en labels
        labelMes.text = getCurrentDate()
        labelGastos.text = getGastos()
        labelGanancias.text = getGanancias()
        labelTotal.text = getTotal()
        print("Hola desde viewWillAppear de VIEWCONTROLLER")
    }

    //MARK: Funciones DB
    private func createDB(){
        Model.createDB("develop")
        Model.openDB()
        Model.execute("CREATE TABLE Quincena (id_quincena INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, mes TEXT NOT NULL, num_quincena TEXT NOT NULL, fecha TEXT NOT NULL, detalles TEXT NOT NULL, monto TEXT NOT NULL)")
        Model.execute("CREATE TABLE Gasto (id_gasto INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, nombre TEXT NOT NULL, detalles TEXT NOT NULL, fecha TEXT NOT NULL, monto TEXT NOT NULL)")
        Model.execute("CREATE TABLE Total (mes TEXT NOT NULL, ingresos TEXT NOT NULL, egresos TEXT NOT NULL, num_de_quincenas TEXT NOT NULL, num_de_gastos TEXT NOT NULL, total TEXT NOT NULL)")
        
    }

}

