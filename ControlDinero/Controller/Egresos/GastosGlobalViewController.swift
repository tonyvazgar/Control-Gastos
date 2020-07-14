//
//  GastosGlobalViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 20/06/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class GastosGlobalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.egresosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gastosGlobal", for: indexPath)
        let item = Model.egresosList[indexPath.row]
        cell.textLabel?.text = item.nombre.capitalizingFirstLetter()
        cell.detailTextLabel?.text = "\(item.detalles)          \(numberFormated(number: item.monto))"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.selectAllEgresoReverse()
        tableView.delegate     = self
        tableView.dataSource   = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
        Model.selectAllEgresoReverse()
    }
}
