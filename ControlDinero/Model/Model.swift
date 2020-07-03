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
    static var dbPointer : OpaquePointer?       = nil
    static var statementPointer: OpaquePointer? = nil
    static var ingresosList                     = Array<Ingreso>()
    static var egresosList                      = Array<Egreso>()
    static var totalList                        = Array<Total>()
    static var dbURL: URL?                      = nil
    
    // MARK: Funciones públicas
    public static func createDB(_ nombre: String){
        //Define the db directory
        Model.dbURL = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        Model.dbURL = Model.dbURL?.appendingPathComponent(nombre + ".sqlite")
        print("Database created at: ", Model.dbURL!)
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
        var queryIsPrepared     : Bool
        var errorMessage        : String
        
        queryIsPrepared         = false
        
        
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
    public static func selectAllIngresos(){
        let selectAllQuery = "SELECT * FROM Quincena"
        if queryIsPrepared(query: selectAllQuery){
            ingresosList = getResultSetIngresos()
        }
    }
    
    public static func selectAllIngresosReverse(){
        let selectAllQuery = "SELECT * FROM Quincena ORDER BY id_quincena DESC"
        if queryIsPrepared(query: selectAllQuery){
            ingresosList = getResultSetIngresos()
        }
    }
    
    public static func selectAllIngresosReverseWhere(mes: String){
        let selectAllQuery = "SELECT * FROM Quincena WHERE mes = '" + mes + "'" + "ORDER BY id_quincena DESC"
        if queryIsPrepared(query: selectAllQuery){
            ingresosList = getResultSetIngresos()
        }
    }
    
    public static func selectFromIngresoWhere(mes: String){
        let query = "SELECT * FROM Quincena WHERE mes = '" + mes + "'"
        print("*--*La query es-->" + query)
        if queryIsPrepared(query: query){
            ingresosList = getResultSetIngresos()
        }
    }
    
    public static func selectFromIngresoWhere(fecha: String){
        let query = "SELECT mes, num_quincena, fecha, detalles, monto FROM Quincena WHERE mes = '" + fecha + "'"
        print("*--*La query es-->" + query)
        if queryIsPrepared(query: query){
            ingresosList = getResultSetIngresos()
        }
    }
    
    public static func insertIntoIngreso(mes: String, num_quincena: String, fecha: String, detalles: String, monto: String){
        let query       = "INSERT INTO Quincena (mes, num_quincena, fecha, detalles, monto) VALUES (?,?,?,?,?)"
        var errMessage  :  String
        
        let mes = mes as NSString
        let num_quincena = num_quincena as NSString
        let fecha = fecha as NSString
        let detalles = detalles as NSString
        let monto = monto as NSString
        
        if queryIsPrepared(query: query){
            if sqlite3_bind_text(statementPointer, 1, mes.utf8String, -1, nil) != SQLITE_OK{
                errMessage = String(cString: sqlite3_errmsg(dbPointer)!)
                print("Faiulure binding mes: \(errMessage)")
                return
            }else{
                print("Binding mes value.... OK...")
            }
            if sqlite3_bind_text(statementPointer, 2, num_quincena.utf8String, -1, nil) != SQLITE_OK {
                errMessage = String(cString: sqlite3_errmsg(dbPointer)!)
                print("Failure binding num_quincena: \(errMessage)")
                return
            }else{
                print("Binding num_quincena OK")
            }
            if sqlite3_bind_text(statementPointer, 3, fecha.utf8String, -1, nil) != SQLITE_OK{
                errMessage = String(cString: sqlite3_errmsg(dbPointer)!)
                print("Faiulure binding fecha: \(errMessage)")
                return
            }else{
                print("Binding fecha value.... OK...")
            }
            if sqlite3_bind_text(statementPointer, 4, detalles.utf8String, -1, nil) != SQLITE_OK{
                errMessage = String(cString: sqlite3_errmsg(dbPointer)!)
                print("Faiulure binding detalles: \(errMessage)")
                return
            }else{
                print("Binding detalles value.... OK...")
            }
            if sqlite3_bind_text(statementPointer, 5, monto.utf8String, -1, nil) != SQLITE_OK {
                errMessage = String(cString: sqlite3_errmsg(dbPointer)!)
                print("Failure binding monto: \(errMessage)")
                return
            }else{
                print("Binding monto OK")
            }
            if sqlite3_step(statementPointer) != SQLITE_DONE{
                errMessage = String(cString: sqlite3_errmsg(dbPointer)!)
                print("Faiulure inserting record: \(errMessage)")
                return
            }else{
                print("Record inserted :)")
            }
        }
    }
    
    public static func deleteFomIngresoWhere(id: Int){
        let query = "DELETE FROM Quincena WHERE id_quincena = \(id)"
        print(query)
        var errorMessage : String
        if (queryIsPrepared(query: query)){
            if sqlite3_step(statementPointer) == SQLITE_DONE{
                print("Row deleted!")
            }else{
                errorMessage = String(cString: sqlite3_errmsg(dbPointer)!)
                print("Failure deleting record \(errorMessage)")
            }
        }
    }
    
    //MARK: CRUD Egresos Class
    public static func selectAllEgresos(){
        let selectAllQuery = "SELECT * FROM Gasto"
        if queryIsPrepared(query: selectAllQuery){
            egresosList = getResultSetEgresos()
        }
    }
    
    public static func insertIntoGasto(nombre: String, detalles: String, fecha: String, mes: String, monto: String){
        /*
        CREATE TABLE "GASTO" (
            "id_gasto"    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            "nombre"      TEXT NOT NULL,
            "detalles"    TEXT NOT NULL,
            "fecha"       TEXT NOT NULL,
            "mes"         TEXT NOT NULL,
            "monto"       REAL NOT NULL
        );
        */
        let query       = "INSERT INTO Gasto (nombre, detalles, fecha, mes, monto) VALUES (?,?,?,?,?)"
        var errMessage  :  String
        
        let nombre      = nombre    as NSString
        let fecha       = fecha     as NSString
        let detalles    = detalles  as NSString
        let mes         = mes       as NSString
        let monto       = monto     as NSString
        
        if queryIsPrepared(query: query){
            if sqlite3_bind_text(statementPointer, 1, nombre.utf8String, -1, nil) != SQLITE_OK{
                errMessage = String(cString: sqlite3_errmsg(dbPointer)!)
                print("Faiulure binding nombre: \(errMessage)")
                return
            }else{
                print("Binding nombre value.... OK...")
            }
            if sqlite3_bind_text(statementPointer, 2, fecha.utf8String, -1, nil) != SQLITE_OK {
                errMessage = String(cString: sqlite3_errmsg(dbPointer)!)
                print("Failure binding fecha: \(errMessage)")
                return
            }else{
                print("Binding fecha OK")
            }
            if sqlite3_bind_text(statementPointer, 3, detalles.utf8String, -1, nil) != SQLITE_OK{
                errMessage = String(cString: sqlite3_errmsg(dbPointer)!)
                print("Faiulure binding detalles: \(errMessage)")
                return
            }else{
                print("Binding detalles value.... OK...")
            }
            if sqlite3_bind_text(statementPointer, 4, mes.utf8String, -1, nil) != SQLITE_OK{
                errMessage = String(cString: sqlite3_errmsg(dbPointer)!)
                print("Faiulure binding mes: \(errMessage)")
                return
            }else{
                print("Binding mes value.... OK...")
            }
            if sqlite3_bind_text(statementPointer, 5, monto.utf8String, -1, nil) != SQLITE_OK{
                errMessage = String(cString: sqlite3_errmsg(dbPointer)!)
                print("Faiulure binding monto: \(errMessage)")
                return
            }else{
                print("Binding monto value.... OK...")
            }
            if sqlite3_step(statementPointer) != SQLITE_DONE{
                errMessage = String(cString: sqlite3_errmsg(dbPointer)!)
                print("Faiulure inserting record: \(errMessage)")
                return
            }else{
                print("Record inserted :)")
            }
        }
    }
    
    //MARK: CRUD Total Class
    public static func selectAllTotal(){
        let selectAllQuery = "SELECT * FROM Total"
        if queryIsPrepared(query: selectAllQuery){
            totalList = getResultSetTotal()
        }
    }
    
    //MARK: Results Set Clases
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
            id_quincena     = sqlite3_column_int(statementPointer, 0)
            mes             = String(cString: sqlite3_column_text(statementPointer, 1))
            num_quincena    = sqlite3_column_int(statementPointer, 2)
            fecha           = String(cString: sqlite3_column_text(statementPointer, 3))
            detalles        = String(cString: sqlite3_column_text(statementPointer, 4))
            monto           = sqlite3_column_double(statementPointer, 5)
            
            //init(_ id_quincena: Int, _ mes: String, _ num_quincena: Int, _ fecha: String, _ detalles: String, _ monto: Double)
            resultSet.append(Ingreso(Int(id_quincena), String(describing: mes), Int(num_quincena), String(describing: fecha), String(describing: detalles), Double(monto)))
        }//end while
        return resultSet
    }
    
    static func getResultSetEgresos() -> Array<Egreso>{
        
        var resultSet       : Array<Egreso>
        
        var id_gasto        : Int32
        var nombre          : String
        var detalles        : String
        var fecha           : String
        var mes             : String
        var monto           : Double
        
        resultSet = []
        
        while(sqlite3_step(statementPointer) == SQLITE_ROW){
            id_gasto    = sqlite3_column_int(statementPointer, 0)
            nombre      = String(cString: sqlite3_column_text(statementPointer, 1))
            detalles    = String(cString: sqlite3_column_text(statementPointer, 2))
            fecha       = String(cString: sqlite3_column_text(statementPointer, 3))
            mes         = String(cString: sqlite3_column_text(statementPointer, 4))
            monto       = sqlite3_column_double(statementPointer, 5)
            
            //(_ id_gasto: Int, _ nombre: String, _ detalles: String, _ fecha: String, _ monto: Double)
            resultSet.append(Egreso(Int(id_gasto), String(describing: nombre), String(describing: detalles), String(describing: fecha), String(describing: mes), Double(monto)))
        }//end while
        return resultSet
    }
    
    static func getResultSetTotal() -> Array<Total>{
        
        var resultSet       : Array<Total>
        
        var mes             : String
        var ingresos        : Double
        var egresos         : Double
        var num_de_quincenas: Int32
        var num_de_gastos   : Int32
        var total           : Double
        
        resultSet = []
        
        while(sqlite3_step(statementPointer) == SQLITE_ROW){
            mes                 = String(cString: sqlite3_column_text(statementPointer, 0))
            ingresos            = sqlite3_column_double(statementPointer, 1)
            egresos             = sqlite3_column_double(statementPointer, 2)
            num_de_quincenas    = sqlite3_column_int(statementPointer, 3)
            num_de_gastos       = sqlite3_column_int(statementPointer, 4)
            total               = sqlite3_column_double(statementPointer, 4)
            
            //init(_ mes: String, _ ingresos: Double, _ egresos: Double, _ num_de_quincenas: Int, _ num_de_gastos: Int, _ total: Double)
            resultSet.append(Total(String(describing: mes), Double(ingresos), Double(egresos), Int(num_de_quincenas), Int(num_de_gastos), Double(total)))
        }//end while
        return resultSet
    }
}
