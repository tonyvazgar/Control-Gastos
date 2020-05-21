//
//  GastosViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 18/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class GastosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nuevoGastoButton: UIButton!
    
    // MARK: Variables para datos
    
    let gastos = [
        "Spotify",
        "Netflix",
        "Comida",
        "GYM",
        "iPhone",
        "PS5",
        "Colegiatura",
        "MercadoLibre",
        "Veterinaria",
        "iCloud",
        "Ejemplo",
        "Ejemplo"
    ]
    let fechasGastos = [
        "2020-05-20",
        "2020-05-19",
        "2020-05-15",
        "2020-05-15",
        "2020-05-15",
        "2020-05-10",
        "2020-05-09",
        "2020-05-02",
        "2020-05-01",
        "2020-04-28",
        "2020-04-20",
        "2020-04-15"
    ]
    
    //MARK: Actions
    
    @IBAction func nuevoGastoAction(_ sender: UIButton) {
        sender.shine()
        sender.jump()
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        nuevoGastoButton.round()
    }
    
    // MARK: Funciones de las extenciones
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Regresa el numero de rows en el Table View
        return gastos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Generar el link para el la celda creada con identificador "quincenas"
        let cell = tableView.dequeueReusableCell(withIdentifier: "gastos", for: indexPath)
        
        //Asignación de labels de la celda con datos recuperados de la BDD
        cell.textLabel?.text = gastos[indexPath.row]
        cell.detailTextLabel?.text = fechasGastos[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(gastos[indexPath.row])
        
        //Instancia del ViewController con idenficador DetalleQuincenaViewController ya elaborado en el StoryBoard
        let viewController = storyboard?.instantiateViewController(withIdentifier: "DetalleGastoViewController") as? DetalleGastoViewController
        
        //Envio de datos para las variables del ViewController
        viewController?.nombre = gastos[indexPath.row]
        
        //Tipo de presentación (tarjeta)
        viewController?.modalPresentationStyle = .pageSheet
        
        //Presentarlo en el navigation controler actual
        self.navigationController?.present(viewController!, animated: true, completion: nil)
        
        //Animación para deseleccionar Row
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

}
