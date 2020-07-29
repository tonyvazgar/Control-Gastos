//
//  QuincenasGlobalViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 20/06/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class MyCellQuincenasGlobal: UITableViewCell {
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var numQuincena: UILabel!
    @IBOutlet weak var fecha: UILabel!
}

class QuincenasGlobalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.ingresosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quincenasGlobal", for: indexPath) as! MyCellQuincenasGlobal
        let item = Model.ingresosList[indexPath.row]
        
        cell.nombre.text = item.mes.capitalizingFirstLetter()
        cell.total.text = "\(numberFormated(number: item.monto))"
        cell.numQuincena.text = "#" + String(item.num_quincena)
        cell.fecha.text = item.fecha
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(55)
    }

    @IBOutlet weak var tablewView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.selectAllIngresosReverse()
        tablewView.delegate     = self
        tablewView.dataSource   = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tablewView.reloadData()
        Model.selectAllIngresosReverse()
    }

}
