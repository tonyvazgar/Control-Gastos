//
//  Total.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 23/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import Foundation

class Total {
    
    // MARK: Atributos de clase
    
    /*
     CREATE TABLE "Total" (
         "mes"    TEXT NOT NULL,
         "ingresos"    REAL NOT NULL,
         "egresos"    REAL NOT NULL,
         "num_de_quincenas"    INTEGER NOT NULL,
         "num_de_gastos"    INTEGER NOT NULL,
         “total”      REAL NOT NULL
     )
     */
    
    var mes: String
    var ingresos: Double
    var egresos: Double
    var num_de_quincenas: Int
    var num_de_gastos: Int
    var total: Double
    
    // MARK: Constructor
    
    init(_ mes: String, _ ingresos: Double, _ egresos: Double, _ num_de_quincenas: Int, _ num_de_gastos: Int, _ total: Double) {
        self.mes = mes
        self.ingresos = ingresos
        self.egresos = egresos
        self.num_de_quincenas = num_de_quincenas
        self.num_de_gastos = num_de_gastos
        self.total = total
    }
}
