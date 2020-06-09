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
    var quincenas = Array<String>()
    
    var numerosQuincenas = Array<String>()
    
    //MARK: Obtener datos BDD
    
    
    // Boton para regresar a ViewController pincipal
    @IBAction func backButtonAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    
    @IBAction func nuevaQuincenaAction(_ sender: UIButton) {
        sender.shine()
        sender.jump()
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.selectAllIngresosReverse()
        tableView.delegate = self
        tableView.dataSource = self
        nuevaQuincenaButton.round()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Mis quincenas"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
        Model.selectAllIngresosReverse()
    }
    
    
    // MARK: Funciones de las extenciones
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Regresa el numero de rows en el Table View
        return Model.ingresosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Generar el link para el la celda creada con identificador "quincenas"
        let cell = tableView.dequeueReusableCell(withIdentifier: "quincenas", for: indexPath)
        
        //Asignación de labels de la celda con datos recuperados de la BDD
        let item = Model.ingresosList[indexPath.row]
            
        cell.textLabel?.text = item.mes
        cell.detailTextLabel?.text = String(item.num_quincena)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Instancia del ViewController con idenficador DetalleQuincenaViewController ya elaborado en el StoryBoard
        let viewController = storyboard?.instantiateViewController(withIdentifier: "DetalleQuincenaViewController") as? DetalleQuincenaViewController
        
        //Envio de datos para las variables del ViewController
        let item = Model.ingresosList[indexPath.row]
            
        viewController?.mes = item.mes
        viewController?.num_quincena = "Quincena #" + String(item.num_quincena)
        viewController?.amount = String(item.monto)
        viewController?.fecha = item.fecha
        viewController?.detalles = item.detalles
        
        //Tipo de presentación (tarjeta)
        viewController?.modalPresentationStyle = .pageSheet
        
        
        
        //Presentarlo en el navigation controler actual
        self.navigationController?.present(viewController!, animated: true, completion: nil)
        
        //Animación para deseleccionar Row
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = AnimationFactory.makeSlideIn(duration: 0.5, delayFactor: 0.00)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
}
