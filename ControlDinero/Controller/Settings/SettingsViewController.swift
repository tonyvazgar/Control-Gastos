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
    
    let titulosSecciones = Text.titulosSeccionInformacion
    let data   = Text.datosSeccionesInformacion
    let images = [[UIImage(systemName: "chart.bar"), UIImage(systemName: "calendar"), UIImage(systemName: "chart.pie")],
                  [UIImage(systemName: "bell.circle")],
                  [UIImage(systemName: "message"), UIImage(systemName: "person")],
//                  [UIImage(systemName: "paintbrush"), UIImage(systemName: "globe")],
                  [UIImage(systemName: "person.2.square.stack"), UIImage(systemName: "bag")]]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGroupedBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Para poner el background del navigation bar al color del fondo :)
        if #available(iOS 13.0, *){
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = .systemGroupedBackground
            navBarAppearance.shadowColor = .clear
            self.navigationController?.navigationBar.standardAppearance = navBarAppearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
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
        cell.imageView?.image = images[indexPath.section][indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if (indexPath.section == 2) && (indexPath.row == 1){
            let url = NSURL(string: "https://www.tonyvazgar.com")
            UIApplication.shared.open(url! as URL)
        }else if (indexPath.section == 2) && (indexPath.row == 0){
            
            let email = "tonyvazgar@icloud.com"
//            let subject = "Sugerencias app Mi Dinero"
            
            if let url = URL(string: "mailto:\(email)") {
              if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
              } else {
                UIApplication.shared.openURL(url)
              }
            }
        }else if (indexPath.section == 3) && (indexPath.row == 0){
            // text to share
            let text = Text.compartir

            // set up activity view controller
            let textToShare = [ text, "https://www.tonyvazgar.com/my_money/index.html" ]
            let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash

            // exclude some activity types from the list (optional)
            activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook, UIActivity.ActivityType.message]
            
            // present the view controller
            self.present(activityViewController, animated: true, completion: nil)
        }else if(((indexPath.section == 0) && (indexPath.row == 0)) || ((indexPath.section == 0) && (indexPath.row == 1)) || ((indexPath.section == 0) && (indexPath.row == 2)) ){
            let alertController = UIAlertController(title: Text.tituloProximamente, message: Text.mensajeProximamente, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)

        }else if (indexPath.section == 1) && (indexPath.row == 0){
            let viewController = storyboard?.instantiateViewController(withIdentifier: "HoraNotificacionViewController") as? HoraNotificacionViewController
                   
            //Tipo de presentación (tarjeta)
            viewController?.modalPresentationStyle = .pageSheet
                   
                   
                   
            //Presentarlo en el navigation controler actual
            self.navigationController?.present(viewController!, animated: true, completion: nil)
                   
            //Animación para deseleccionar Row
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}
