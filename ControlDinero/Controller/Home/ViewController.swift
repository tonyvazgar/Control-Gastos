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
        Model.selectFromEgresoWhere(mes: getCurrentDate())
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
        if diferencia > 0 {
            labelTotal.textColor = .green
        }else if diferencia < 0{
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

        configuration.apply(theme: .blue)
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
            [WhatsNew.Item(title: "Privacidad garantizada", subtitle: "Todos los datos se guardan en el iPhone, nunca se comparten.", image: UIImage(systemName: "lock")),
             WhatsNew.Item(title: "Anota tus compras", subtitle: "Lleva el control con el total de tus compras.", image: UIImage(systemName: "cart")),
             WhatsNew.Item(title: "Ingresos y egresos", subtitle: "Anota cuando recibas dinero y cuando gastes en cualquier cosa.", image: UIImage(systemName: "plusminus")),
             WhatsNew.Item(title: "Detalles de tus gastos", subtitle: "Puedes ver la descripcón de tus gastos para recordar su finalidad.", image: UIImage(systemName: "questionmark.circle")),
             WhatsNew.Item(title: "Control mensual", subtitle: "Lleva el control total de dinero en base a los ingresos y egresos en el  mes actual. ", image: UIImage(systemName: "calendar"))])
        
        guard let vc = WhatsNewViewController(whatsNew: items, configuration: configuration, versionStore: KeyValueWhatsNewVersionStore()) else {
            return
        }
//        let vc = WhatsNewViewController(whatsNew: items, configuration: configuration)
        vc.isModalInPresentation = true
        present(vc, animated: true)
    }

    //MARK: Funciones DB
    private func createDB(){
        Model.createDB("develop")
        Model.openDB()
        Model.execute("CREATE TABLE Quincena (id_quincena INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, mes TEXT NOT NULL, num_quincena TEXT NOT NULL, fecha TEXT NOT NULL, detalles TEXT NOT NULL, monto TEXT NOT NULL)")
        Model.execute("CREATE TABLE Gasto (id_gasto INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, nombre TEXT NOT NULL, detalles TEXT NOT NULL, fecha TEXT NOT NULL, mes TEXT NOT NULL, monto TEXT NOT NULL)")
//        Model.execute("CREATE TABLE Total (mes TEXT NOT NULL, ingresos TEXT NOT NULL, egresos TEXT NOT NULL, num_de_quincenas TEXT NOT NULL, num_de_gastos TEXT NOT NULL, total TEXT NOT NULL)")
//        Model.execute("INSERT INTO Quincena (mes, num_quincena, fecha, detalles, monto) VALUES ('Junio 2019', '1', '15.06.2019', 'Quincena del mes', '2691.08'), ('Julio 2019', '1', '15.07.2019', 'Quincena del mes', '2912.33'), ('Julio 2019', '2', '30.07.2019', 'Quincena del mes', '3222.56'), ('Agosto 2019', '1', '15.08.2019', 'Quincena del mes', '3141.4'), ('Agosto 2019', '2', '30.08.2019', 'Quincena del mes', '3080.13'), ('Septiembre 2019', '1', '15.09.2019', 'Quincena del mes', '3141.41'), ('Septiembre 2019', '2', '30.09.2019', 'Quincena del mes', '2977.27'), ('Octubre 2019', '1', '15.10.2019', 'Quincena del mes', '2935.29'), ('Octubre 2019', '2', '30.10.2019', 'Quincena del mes', '3015.25'), ('Noviembre 2019', '1', '15.11.2019', 'Quincena del mes', '3345.49'), ('Noviembre 2019', '2', '30.11.2019', 'Quincena del mes', '3469.76'), ('Diciembre 2019', '1', '15.12.2019', 'Quincena del mes', '5268.86'), ('Diciembre2019', '2', '30.12.2019', 'Quincena del mes', '3372.5'), ('Enero 2020', '1', '15.01.2020', 'Quincena del mes', '2674.82'), ('Enero 2020', '2', '30.01.2020', 'Quincena del mes', '20157.92'), ('Febrero 2020', '1', '15.02.2020', 'Quincena del mes', '6569.13'), ('Febrero 2020', '2', '29.02.2020', 'Quincena del mes', '6581.35'), ('Marzo 2020', '1', '15.03.2020', 'Quincena del mes', '6441.23'), ('Marzo 2020', '2', '30.03.2020', 'Quincena del mes', '6441.23'), ('Abril 2020', '1', '15.04.2020', 'Quincena del mes', '6685.71'), ('Abril 2020', '2', '30.04.2020', 'Quincena del mes', '6440.48'), ('Mayo 2020', '1', '15.05.2020', 'Quincena del mes', '6569.27'), ('Mayo 2020', '2', '30.05.2020', 'Quincena del mes', '6555.57'), ('Junio 2020', '1', '15.06.2020', 'Quincena del mes', '6569.27'), ('Junio 2020', '2', '31.06.2020', 'Quincena del mes', '6569.27'), ('Julio 2020', '1', '15.07.2020', 'Quincena del mes', '6568.98')")
//
//        Model.execute("INSERT INTO Gasto (nombre, detalles, fecha, mes, monto) VALUES ('Gym','Pago del gym de Enero','01.01.2020','Enero 2020','1600'), ('Nikon D3500','Mensualidad 5/9','01.01.2020','Enero 2020','1300'), ('Generales','Apple Music/iCloud/Recargas','01.01.2020','Enero 2020','400'), ('Gastos casa','Agua, Luz, etc','01.01.2020','Enero 2020','1000'), ('Gym','Pago del gym de Febrero','01.02.2020','Febrero 2020','1600'), ('Nikon D3500','Mensualidad 6/9','01.02.2020','Febrero 2020','1300'), ('Apple Watch','Mensalidad 1/6','01.02.2020','Febrero 2020','1250'), ('Generales','Apple Music/iCloud/Recargas','01.02.2020','Febrero 2020','400'), ('Gastos casa','Agua, Luz, etc','01.02.2020','Febrero 2020','1000'), ('Gym','Pago del gym de Marzo','01.03.2020','Marzo 2020','1600'), ('Nikon D3500','Mensualidad 7/9','01.03.2020','Marzo 2020','1300'), ('Apple Watch','Mensalidad 2/6','01.03.2020','Marzo 2020','1250'), ('Generales','Apple Music/iCloud/Recargas','01.03.2020','Marzo 2020','400'), ('Gastos casa','Agua, Luz, etc','01.03.2020','Marzo 2020','1000'), ('Nikon D3500','Mensualidad 8/9','01.04.2020','Abril 2020','1300'), ('Apple Watch','Mensalidad 3/6','01.04.2020','Abril 2020','1250'), ('Generales','Apple Music/iCloud/Recargas','01.04.2020','Abril 2020','400'), ('Gastos casa','Agua, Luz, etc','01.04.2020','Abril 2020','916'), ('Nikon D3500','Mensualidad 9/9','01.05.2020','Mayo 2020','1300'), ('Apple Watch','Mensalidad 4/6','01.05.2020','Mayo 2020','1250'), ('Generales','Apple Music/iCloud/Recargas','01.05.2020','Mayo 2020','400'), ('Gastos casa','Agua, Luz, etc','01.05.2020','Mayo 2020','1000'), ('Nikon Z50','Mensualidad 1/15','01.06.2020','Junio 2020','1610'), ('Apple Watch','Mensalidad 5/6','01.06.2020','Junio 2020','1250'), ('Generales','Apple Music/iCloud/Recargas','01.06.2020','Junio 2020','400'), ('Gastos casa','Agua, Luz, etc','01.06.2020','Junio 2020','925'), ('Nikon Z50','Mensualidad 2/15','01.07.2020','Julio 2020','1610'), ('Apple Watch','Mensalidad 6/6','01.07.2020','Julio 2020','1250'), ('Generales','Apple Music/iCloud/Recargas','01.07.2020','Julio 2020','400'), ('Gastos casa','Agua, Luz, etc','01.07.2020','Julio 2020','1000'), ('Extracción muela del juicio','Debo a machumis lo de la muela','20.07.2020','Julio 2020','2150'), ('Mochila Camara','Mochila de las camaras y lentes','15.07.2020','Julio 2020','1000'), ('Simplii','Portabilidad de número a Simplii','22.07.2020','Julio 2020','300'), ('Apple Watch Nike Sport Loop','Banda negra para el Applw Watch','24.07.2020','Julio 2020','1000'), ('Apoyo GYM','Cobraron $590 de la mensualidad para mantener suscripción','05.08.2020','Agosto 2020','590'), ('Nikon Z50','Mensualidad 3/15','01.08.2020','Agosto 2020','1610'), ('Generales','Apple Music/iCloud/Recargas','01.08.2020','Agosto 2020','400'), ('Resinas de muelas','4 muelas tapadas el 6 de Agosto','06.08.2020','Agosto 2020','2300'), ('Restante muela del juicio','Lo restante que le debo a Machumis de la muela del juicio','02.08.2020','Agosto 2020','1000')")
    }

}

