//
//  GastosGlobalViewController.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 20/06/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var monto: UILabel!
    @IBOutlet weak var detalles: UILabel!
    
}

class GastosGlobalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.egresosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gastosGlobal", for: indexPath) as! MyCell
        let item = Model.egresosList[indexPath.row]
        cell.titulo.text = item.nombre.capitalizingFirstLetter()
        cell.detalles.text = item.detalles
        cell.monto.text = "\(numberFormated(number: item.monto))"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(55)
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
    
    @IBAction func exportButton(_ sender: UIButton) {
        //------------------------------------------------
        let fileName = Text.fileNameGastosGlobal
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let documentURL = URL(fileURLWithPath: documentDirectory).appendingPathComponent(fileName)
        //------------------------------------------------
        let output = OutputStream.toMemory()
        let csvWriter = CHCSVWriter(outputStream: output, encoding: String.Encoding.utf8.rawValue, delimiter: ",".utf16.first!)
        //------------------------------------------------
        let campos = Text.fileFieldsGastos
        for element in campos{
            csvWriter?.writeField(element)
        }
        csvWriter?.finishLine()
        //------------------------------------------------
        for element in Model.egresosList{
            //["#", "Nombre", "Fecha", "Total", "Detalles", "c", "d"]
            csvWriter?.writeField(element.id_gasto)
            csvWriter?.writeField(element.nombre)
            csvWriter?.writeField(element.fecha)
            csvWriter?.writeField(element.monto)
            csvWriter?.writeField(element.detalles)
            csvWriter?.writeField(element.mes)
            csvWriter?.finishLine()
        }
        csvWriter?.closeStream()
        //------------------------------------------------
        let buffer = (output.property(forKey: .dataWrittenToMemoryStreamKey) as? Data)!
        do{
            try buffer.write(to: documentURL)
        }catch{
            
        }
        //------------------------------------------------
        let activityViewController = UIActivityViewController(activityItems: [documentURL], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        self.present(activityViewController, animated: true, completion: nil)
    }
}
