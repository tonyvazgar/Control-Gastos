//
//  Model.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 23/05/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import SQLite3
import UIKit

public class Model{
    
    // MARK: Atributos estaticos
    static var dbPointer : OpaquePointer? = nil
    static var statementPointer: OpaquePointer? = nil
    static var ingresosList = Array<Ingreso>()
    static var egresosList = Array<Egreso>()
    static var totalList = Array<Total>()
    static var dbURL: URL? = nil
    
    // MARK: Funciones públicas
    public static func createDB(_ nombre: String){
        //Define the db directory
        Model.dbURL = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        Model.dbURL = Model.dbURL?.appendingPathComponent(nombre + ".sqlite")
        print("Database created at: ", Model.dbURL!)
        print(Model.dbURL!)
    }
    
    public static func openDB(){
        if (sqlite3_open(Model.dbURL!.path, &Model.dbPointer) != SQLITE_OK){
            print("Error opening database.")
        }else{
            print("Database open.")
        }
    }
    
    public static func execute(_ aStatement: String){
        var errorMessage: String
        if(sqlite3_exec(Model.dbPointer, aStatement, nil, nil, nil) != SQLITE_OK){
            errorMessage = String(cString: sqlite3_errmsg(Model.dbPointer)!)
            print("error excecuting SQL statement: \(errorMessage)")
        }else{
            print("SQL statement excecuted: \(aStatement)")
        }
    }
    
    //MARK: Funciones privadas
    private static func queryIsPrepared(query: String) -> Bool {
        var queryIsPrepared: Bool
        var errorMessage: String
        
        queryIsPrepared = false
        if sqlite3_prepare(dbPointer, query, -1, &statementPointer, nil) != SQLITE_OK{
            errorMessage = String(cString: sqlite3_errmsg(dbPointer)!)
            print("Error preparing query: " + query)
            print(errorMessage)
        } else{
            queryIsPrepared = true
        }
        return queryIsPrepared
    }
    
    //MARK: CRUD Ingresos Class
    public static func ingresosSelectAll(){
        let selectAllQuery = "SELECT * FROM Quincenas"
        if queryIsPrepared(query: selectAllQuery){
            ingresosList = getResultSetIngresos()
        }
    }
    static func getResultSetIngresos() -> Array<Ingreso>{
        
        var resultSet       : Array<Ingreso>
        
        var id_quincena     : Int32
        var mes             : String
        var num_quincena    : Int32
        var fecha           : String
        var detalles        : String
        var monto           : Double
        
        resultSet = []
        
        while(sqlite3_step(statementPointer) == SQLITE_ROW){
            id_quincena = sqlite3_column_int(statementPointer, 0)
            mes = String(cString: sqlite3_column_text(statementPointer, 1))
            num_quincena = sqlite3_column_int(statementPointer, 2)
            fecha = String(cString: sqlite3_column_text(statementPointer, 3))
            detalles = String(cString: sqlite3_column_text(statementPointer, 4))
            monto = sqlite3_column_double(statementPointer, 5)
            
            resultSet.append(Ingreso(Int(id_quincena), String(describing: mes), Int(num_quincena), String(describing: fecha), String(describing: detalles), Double(monto)))
        }//end while
        return resultSet
    }
    
    //MARK: CRUD Egresos Class
    
    //MARK: CRUD Total Class
}
