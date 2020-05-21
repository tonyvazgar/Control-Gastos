//
//  QuincenasViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 18/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class QuincenasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nuevaQuincenaButton: UIButton!
    
    // MARK: Variables para datos
    let quincenas = [
        "Enero 2020",
        "Febrero 2020",
        "Marzo 2020",
        "Abril 2020",
        "Mayo 2020"
    ]
    
    let numerosQuincenas = [
        "2",
        "2",
        "2",
        "2",
        "1"
    ]
    
    
    //MARK: Actions
    
    @IBAction func nuevaQuincenaAction(_ sender: UIButton) {
        sender.shine()
        sender.jump()
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        nuevaQuincenaButton.round()
    }
    
    // MARK: Funciones de las extenciones
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Regresa el numero de rows en el Table View
        return quincenas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Generar el link para el la celda creada con identificador "quincenas"
        let cell = tableView.dequeueReusableCell(withIdentifier: "quincenas", for: indexPath)
        
        //Asignación de labels de la celda con datos recuperados de la BDD
        cell.textLabel?.text = quincenas[indexPath.row]
        cell.detailTextLabel?.text = numerosQuincenas[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(quincenas[indexPath.row])
        
        //Instancia del ViewController con idenficador DetalleQuincenaViewController ya elaborado en el StoryBoard
        let viewController = storyboard?.instantiateViewController(withIdentifier: "DetalleQuincenaViewController") as? DetalleQuincenaViewController
        
        //Envio de datos para las variables del ViewController
        viewController?.mes = quincenas[indexPath.row]
        
        //Tipo de presentación (tarjeta)
        viewController?.modalPresentationStyle = .pageSheet
        
        //Presentarlo en el navigation controler actual
        self.navigationController?.present(viewController!, animated: true, completion: nil)
        
        //Animación para deseleccionar Row
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


