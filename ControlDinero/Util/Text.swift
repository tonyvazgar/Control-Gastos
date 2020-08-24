//
//  Text.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 23/08/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import Foundation

enum Text {
    static var backTitleGanancias: String {
        switch getDeviceLanguage() {
        case "es":
            return "Mis ingresos"
        default:
            return "My earnings"
        }
    }
    static var backTitleGastos: String {
        switch getDeviceLanguage() {
        case "es":
            return "Mis gastos"
        default:
            return "My expenses"
        }
    }
    static var titleBorrarIngreso: String{
        switch getDeviceLanguage() {
        case "es":
            return "¿Borrar ingreso de "
        default:
            return "Delete income from "
        }
    }
    
    static var misIngresosTitleAlertVacio: String{
        switch getDeviceLanguage() {
        case "es":
            return "Campos vacíos"
        default:
            return "Empty fields"
        }
    }
    static var misIngresosMessageAlertVacio: String{
        switch getDeviceLanguage() {
        case "es":
            return "Debes rellenar los campos de descripción y de monto total"
        default:
            return "You must fill the description and the amount fields"
        }
    }
    
    static var misGastosMessageAlertVacio: String{
        switch getDeviceLanguage() {
        case "es":
            return "Debes rellenar los campos de nombre, detalles y de monto total"
        default:
            return "You must fill the name, description and the amount fields"
        }
    }
    
    static var misIngresosTitleNumQuincena: String{
        switch getDeviceLanguage() {
        case "es":
            return "Falta el número de ingreso"
        default:
            return "Income number is missing"
        }
    }
    
    static var misIngresosMessageNumQuincena: String{
        switch getDeviceLanguage() {
        case "es":
            return "Debes seleccionar el número de ingreso para agregarlo"
        default:
            return "You must select the income number to add it"
        }
    }
    
    
}
