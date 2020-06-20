//
//  Ingreso.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 23/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import Foundation

class Ingreso {
    
    // MARK: Atributos de clase
    
    /*
     CREATE TABLE "QUINCENA" (
         "id_quincena"    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
         "mes"    TEXT NOT NULL,
         "num_quincena"    INTEGER NOT NULL,
         "fecha"    TEXT NOT NULL,
         "detalles"    TEXT NOT NULL,
         "monto"    REAL NOT NULL
     );
     */
    
    var id_quincena: Int
    var mes: String
    var num_quincena: Int
    var fecha: String
    var detalles: String
    var monto: Double
    
    // MARK: Constructor
    
    init(_ id_quincena: Int, _ mes: String, _ num_quincena: Int, _ fecha: String, _ detalles: String, _ monto: Double) {
        self.id_quincena = id_quincena
        self.mes = mes
        self.num_quincena = num_quincena
        self.fecha = fecha
        self.detalles = detalles
        self.monto = monto
    }
    
    
    var description: String {
        return "**** ID: \(self.id_quincena) --> (Mes: \(self.mes), num_quincena: \(self.num_quincena), fecha: \(self.fecha), detalles: \(self.detalles), monto: \(self.monto)) ****"
    }
}
