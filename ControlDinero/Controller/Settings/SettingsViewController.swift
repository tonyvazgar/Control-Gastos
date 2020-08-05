//
//  SettingsViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 04/08/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let titulosSecciones = ["Resumenes financieros", "Información de la app", "Visuales", "Traducción", "Comparte la app"]
    let data = [["Gráficas (Próximamente)", "Resumen mensual (Próximamente)"],
                ["Sugerencias", "Calificar app", "Desarrollador de la app"],
                ["Aquí va un nombre"],
                ["Aquí va otro nombre"],
                ["Cuéntaselo a tus amigos"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // MARK: Implementaciones TableView
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < titulosSecciones.count {
            return titulosSecciones[section]
        }
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titulosSecciones.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Regresa el numero de rows en el Table View
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Generar el link para el la celda creada con identificador "quincenas"
        let cell = tableView.dequeueReusableCell(withIdentifier: "configuracion", for: indexPath)
        
        //Asignación de labels de la celda con datos recuperados de la BDD
        let item = data[indexPath.section][indexPath.row]
            
        cell.textLabel?.text = item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
