//
//  SettingsTableViewControllerNuevo.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 12/08/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewControllerNuevo: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
        let table: UITableViewController = self
        let tableView: UITableView = UITableView()
        tableView.dataSource = table
        tableView.delegate = table

        self.view.addSubview(tableView)
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        NSLog("sections")
        return 2
    }

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("rows")
        return 3
    }

     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        NSLog("get cell")
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        cell.textLabel!.text = "foo"
        return cell
    }
}
