//
//  QuincenasViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 18/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class QuincenasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nuevaQuincenaButton: UIButton!
    
    let quincenas = [
        "Enero 2020",
        "Febrero 2020",
        "Marzo 2020",
        "Abril 2020",
        "Mayo 2020"
    ]
    
    @IBAction func nuevaQuincenaAction(_ sender: UIButton) {
        sender.shine()
        sender.jump()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        nuevaQuincenaButton.round()
    }
    
    // MARK: Funciones de las implementaciones
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quincenas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quincenas", for: indexPath)
        cell.textLabel?.text = quincenas[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(quincenas[indexPath.row])
        let viewController = storyboard?.instantiateViewController(withIdentifier: "DetalleQuincenaViewController") as? DetalleQuincenaViewController
        viewController?.mes = quincenas[indexPath.row]
        viewController?.modalPresentationStyle = .pageSheet
        self.navigationController?.present(viewController!, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}


