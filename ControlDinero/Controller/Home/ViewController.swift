//
//  ViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 17/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit
import WhatsNewKit

class ViewController: UIViewController {

    // MARK: Declaración de variables
    @IBOutlet weak var labelMes: UILabel!
    @IBOutlet weak var labelGanancias: UILabel!
    @IBOutlet weak var labelGastos: UILabel!
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var quincenasButton: UIButton!
    @IBOutlet weak var gastosButton: UIButton!
    @IBOutlet weak var todoButton: UIButton!
    
    
    // MARK: Actions
    @IBAction func buttonQuincenas(_ sender: UIButton) {
        sender.shine()
        sender.jump()
    }
    
    @IBAction func buttonGastos(_ sender: UIButton) {
        sender.shine()
        sender.jump()
    }
    
    // MARK: Funciones privadas
    private func getGanancias() -> String {
        var ganancias = 0.0
        Model.selectFromIngresoWhere(mes: getCurrentDate())
        for ingreso in Model.ingresosList{
            let quincena = Double(ingreso.monto)
            print(ingreso.description)
            ganancias += quincena
        }
        let total = String(describing: ganancias)
        return total
    }
    
    private func getGastos() -> String {
        var gastos = 0.0
        Model.selectAllEgresos()
        for egreso in Model.egresosList{
            let gasto = Double(egreso.monto)
            //print(egreso.description)
            gastos += gasto
        }
        let total = String(describing: gastos)
        return total
    }
    
    private func getTotal() -> String {
        let ganacias         = Double(getGanancias())!
        let gastos           = Double(getGastos())!
        let diferencia       = Double(round(1000*(ganacias-gastos))/1000)
        if diferencia >= 0 {
            labelTotal.textColor = .green
        }else{
            labelTotal.textColor = .red
        }
        return String(describing: diferencia)
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
        todoButton.round()
        todoButton.jump()
        todoButton.bounce()
        Model.selectAllIngresos()
        Model.selectAllEgresos()
        labelGanancias.reloadInputViews()
        labelGastos.reloadInputViews()
        labelTotal.reloadInputViews()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        labelGanancias.reloadInputViews()
        labelGastos.reloadInputViews()
        labelTotal.reloadInputViews()
        Model.selectAllIngresos()
        Model.selectAllEgresos()
        //Obtener datos para poner en labels
        labelMes.text = getCurrentDate()
        labelGastos.text = numberFormated(number: Double(getGastos())!)
        labelGanancias.text = numberFormated(number: Double(getGanancias())!)
        labelTotal.text = numberFormated(number: Double(getTotal())!)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        var configuration = WhatsNewViewController.Configuration()

        configuration.apply(theme: .orange)
        configuration.titleView.animation = .slideDown
        configuration.titleView.titleFont = .systemFont(ofSize: 50, weight: .bold)
        configuration.titleView.insets = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
        configuration.itemsView.titleFont = .systemFont(ofSize: 15)
        configuration.itemsView.contentMode = .fill
        configuration.itemsView.imageSize = .fixed(height: 28)
        configuration.itemsView.titleFont = .systemFont(ofSize: 20, weight: .bold)
        configuration.itemsView.animation = .slideRight
        configuration.completionButton.title = "OK"
        
        let items = WhatsNew(title: "Bienvenido a \n Control de \n Gastos", items:
            [WhatsNew.Item(title: "Crea salud financiera", subtitle: "Identifica tus gastos en base a tus ingresos", image: UIImage(systemName: "heart")),
             WhatsNew.Item(title: "Anota tus compras", subtitle: "Lleva el control con el total de tus compras", image: UIImage(systemName: "cart")),
             WhatsNew.Item(title: "Ingresos y egresos", subtitle: "Anota cuando recibas dinero y cuando gastes en cualquier cosa", image: UIImage(systemName: "plusminus")),
             WhatsNew.Item(title: "Detalles de tus gastos", subtitle: "Puedes ver la descripcón de tus gastos para recordar su finalidad.", image: UIImage(systemName: "questionmark.circle")),
             WhatsNew.Item(title: "Control mensual", subtitle: "Lleva el control total de dinero en base a los ingresos y egresos en el  mes actual ", image: UIImage(systemName: "calendar"))])
        
        guard let vc = WhatsNewViewController(whatsNew: items, configuration: configuration, versionStore: KeyValueWhatsNewVersionStore()) else {
            return
        }
        vc.isModalInPresentation = true
        present(vc, animated: true)
    }

    //MARK: Funciones DB
    private func createDB(){
        Model.createDB("develop")
        Model.openDB()
        Model.execute("CREATE TABLE Quincena (id_quincena INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, mes TEXT NOT NULL, num_quincena TEXT NOT NULL, fecha TEXT NOT NULL, detalles TEXT NOT NULL, monto TEXT NOT NULL)")
        Model.execute("CREATE TABLE Gasto (id_gasto INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, nombre TEXT NOT NULL, detalles TEXT NOT NULL, fecha TEXT NOT NULL, mes TEXT NOT NULL, monto TEXT NOT NULL)")
        Model.execute("CREATE TABLE Total (mes TEXT NOT NULL, ingresos TEXT NOT NULL, egresos TEXT NOT NULL, num_de_quincenas TEXT NOT NULL, num_de_gastos TEXT NOT NULL, total TEXT NOT NULL)")
    }

}

