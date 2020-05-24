//
//  Egreso.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 23/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import Foundation

class Egreso {
    
    // MARK: Atributos de clase
    
    /*
     CREATE TABLE "GASTO" (
         "id_gasto"    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
         "nombre"    TEXT NOT NULL,
         "detalles"    TEXT NOT NULL,
         "fecha"    TEXT NOT NULL,
         "monto"    REAL NOT NULL
     );
     */
    
    var id_gasto: Int
    var nombre: String
    var detalles: String
    var fecha: Date
    var monto: Double
    
    // MARK: Constructor
    
    init(_ id_gasto: Int, _ nombre: String, _ detalles: String, _ fecha: Date, _ monto: Double) {
        self.id_gasto = id_gasto
        self.nombre = nombre
        self.detalles = detalles
        self.fecha = fecha
        self.monto = monto
    }
}
