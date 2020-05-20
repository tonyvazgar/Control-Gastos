//
//  GastosViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 18/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class GastosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nuevoGastoButton: UIButton!
    
    let gastos = [
        "Spotify",
        "Netflix",
        "Comida",
        "GYM",
        "iPhone",
        "PS5",
        "Colegiatura",
        "Brazzers",
        "Veterinaria",
        "iCloud",
        "Ejemplo",
        "Ejemplo",
        
    ]
    @IBAction func nuevoGastoAction(_ sender: UIButton) {
        sender.shine()
        sender.jump()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        nuevoGastoButton.round()
    }
    
    // MARK: Funciones de las implementaciones
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gastos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gastos", for: indexPath)
        cell.textLabel?.text = gastos[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(gastos[indexPath.row])
        let viewController = storyboard?.instantiateViewController(withIdentifier: "DetalleGastoViewController") as? DetalleGastoViewController
        viewController?.nombre = gastos[indexPath.row]
        viewController?.modalPresentationStyle = .pageSheet
        self.navigationController?.present(viewController!, animated: true, completion: nil)
        
    }

}
