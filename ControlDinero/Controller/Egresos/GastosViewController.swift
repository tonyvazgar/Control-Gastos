//
//  GastosViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 18/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class MyCellGastoViewController: UITableViewCell {
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var monto: UILabel!
    @IBOutlet weak var descrip: UILabel!
}

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
        Model.selectAllEgresosReverseWhere(mes: getCurrentDate())
        tableView.delegate = self
        tableView.dataSource = self
        nuevoGastoButton.round()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
        Model.selectAllEgresosReverseWhere(mes: getCurrentDate())
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(55)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = Text.backTitleGastos
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }
    
    // MARK: Funciones de las extenciones
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Regresa el numero de rows en el Table View
        return Model.egresosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Generar el link para el la celda creada con identificador "quincenas"
        let cell = tableView.dequeueReusableCell(withIdentifier: "gastos", for: indexPath) as! MyCellGastoViewController
        
        //Asignación de labels de la celda con datos recuperados de la BDD
        let item = Model.egresosList[indexPath.row]
        
        cell.titulo.text = item.nombre.capitalizingFirstLetter()
        cell.descrip.text = item.detalles
        cell.monto.text = "\(numberFormated(number: item.monto))"
        
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
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let animation = AnimationFactory.makeSlideIn(duration: 0.5, delayFactor: 0.00)
//        let animator = Animator(animation: animation)
//        animator.animate(cell: cell, at: indexPath, in: tableView)
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let item    = Model.egresosList[indexPath.row]
            
            let tittleBorrar: String
            let messageBorrar: String
            let alertController: UIAlertController
            let cancelText: String
            let borrarText: String
            
            if getDeviceLanguage() == "es"{
                tittleBorrar  = "¿Borrar '\(item.nombre.lowercased())'?"
                messageBorrar = "¿Estás seguro que quieres eliminar \(item.nombre.lowercased()) creado el \(item.fecha) con un total de \(numberFormated(number: item.monto))?"
                cancelText = "Cancelar"
                borrarText = "Borrar"
            }else{
                tittleBorrar  = "Delete '\(item.nombre.lowercased())'?"
                messageBorrar = "Are you sure you want to delete the '\(item.nombre.lowercased())' created the \(item.fecha) with a total of \(numberFormated(number: item.monto))?"
                cancelText = "Cancel"
                borrarText = "Delete"
            }
            
            alertController = UIAlertController(title: tittleBorrar, message: messageBorrar, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: cancelText, style: .cancel, handler: nil)
            let deleteAction = UIAlertAction(title: borrarText, style: .destructive, handler: {
                (action) -> Void in
                Model.deleteFomEgresoWhere(id: item.id_gasto)
                Model.egresosList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            })
            alertController.addAction(deleteAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
    }

}
