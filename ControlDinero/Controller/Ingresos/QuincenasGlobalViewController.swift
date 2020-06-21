//
//  QuincenasGlobalViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 20/06/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class QuincenasGlobalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.ingresosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quincenasGlobal", for: indexPath)
        let item = Model.ingresosList[indexPath.row]
        cell.textLabel?.text = item.mes.capitalizingFirstLetter()
        cell.detailTextLabel?.text = String(item.num_quincena)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
