//
//  excelViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 26/12/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class excelViewController: UIViewController{
    
    let titulos = ["Mes", "Historial"]
    let data = [["Ingresos", "Gastos"],
                ["Ingresos", "Gastos"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGroupedBackground
        
//        tableView.delegate = self
//        tableView.dataSource = self
//        print(data)
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
}
