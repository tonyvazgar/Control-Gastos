//
//  Recordatorio.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 13/09/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import Foundation

class Recordatorio {
    
    // MARK: Atributos de clase
    
    /*
     CREATE TABLE "Recordatorio" (
         "id_recordatorio"       INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
         "hora"     INTEGER NOT NULL
     )
     */
    
    var id_recordatorio : Int
    var hora            : String
    
    // MARK: Constructor
    
    init(_ id_recordatorio: Int, _ hora: String) {
        self.id_recordatorio = id_recordatorio
        self.hora            = hora
    }
}
