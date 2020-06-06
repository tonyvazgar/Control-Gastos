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
    var gastos = Array<String>()
    var fechasGastos = Array<String>()
    
    
    //MARK: Actions
    
    @IBAction func nuevoGastoAction(_ sender: UIButton) {
        sender.shine()
        sender.jump()
    }
    
    // Boton para regresar a ViewController pincipal
    @IBAction func backButtonAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.selectAllEgresos()
        tableView.delegate = self
        tableView.dataSource = self
        nuevoGastoButton.round()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
        Model.selectAllEgresos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Mis gastos"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }
    
    // MARK: Funciones de las extenciones
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Regresa el numero de rows en el Table View
        return Model.egresosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Generar el link para el la celda creada con identificador "quincenas"
        let cell = tableView.dequeueReusableCell(withIdentifier: "gastos", for: indexPath)
        
        //Asignación de labels de la celda con datos recuperados de la BDD
        let item = Model.egresosList[indexPath.row]
        
        cell.textLabel?.text = item.nombre.capitalizingFirstLetter()
        cell.detailTextLabel?.text = "\(item.detalles)          \(numberFormated(number: item.monto))"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Instancia del ViewController con idenficador DetalleQuincenaViewController ya elaborado en el StoryBoard
        let viewController = storyboard?.instantiateViewController(withIdentifier: "DetalleGastoViewController") as? DetalleGastoViewController
        
        //Envio de datos para las variables del ViewController
        let item = Model.egresosList[indexPath.row]
        
        viewController?.nombre = item.nombre.capitalizingFirstLetter()
        viewController?.fecha = item.fecha
        viewController?.detalles = item.detalles
        viewController?.monto = String(item.monto)
        
        //Tipo de presentación (tarjeta)
        viewController?.modalPresentationStyle = .pageSheet
        
        //Presentarlo en el navigation controler actual
        self.navigationController?.present(viewController!, animated: true, completion: nil)
        
        //Animación para deseleccionar Row
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

}
