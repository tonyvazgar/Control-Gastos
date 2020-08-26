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
    
    static var titulosSeccionInformacion: [String] {
        switch getDeviceLanguage() {
        case "es":
            return ["Resumenes financieros (próximamente)",
                    "Información de contacto",
                    "Comparte la app"]
//            ["Resumenes financieros (próximamente)",
//            "Información de contacto",
//            "Colaboradores",
//            "Comparte la app"]
        default:
            return ["Financial Summaries (Coming Soon)",
                    "Contact Information",
                    "Share the App"]
//            ["Financial Summaries (Coming Soon)",
//            "Contact Information",
//            "Collaborators",
//            "Share the App"]
        }
    }
    
    static var datosSeccionesInformacion: [[String]] {
        switch getDeviceLanguage() {
        case "es":
            return [["Gráficas", "Resumen mensual", "Estadísticas"],
                    ["Sugerencias o contacto", "Desarrollador de la app"],
                    ["Compartela con tus amigos", "Ver en la App Store"]]
//            [["Gráficas", "Resumen mensual", "Estadísticas"],
//            ["Sugerencias o contacto", "Desarrollador de la app"],
//            ["@SSfsd(Diseño)", "@dsasa  (traducción Frances)"],
//            ["Compartela con tus amigos", "Ver en la App Store"]]
        default:
            return [["Charts", "Monthly Summary", "Statistics"],
                    ["Suggestions/contact", "App Developer"],
//                    ["@SSfsd (Design)", "@dsasa (French translation)"],
                    ["Tell your friends", "Watch on the App Store"]]
//            [["Charts", "Monthly Summary", "Statistics"],
//            ["Suggestions/contact", "App Developer"],
//            ["@SSfsd (Design)", "@dsasa (French translation)"],
//            ["Tell your friends", "Watch on the App Store"]]
        }
    }
    
    static var itemsWhatsNew: [[String]]{
        switch getDeviceLanguage() {
        case "es":
            return [["Privacidad garantizada", "Todos los datos se guardan en el iPhone, nunca son compartidos."],
                    ["Apunta tus compras", "Lleva el control del total de tus compras."],
                    ["Ingresos y gastos", "Registra cuando ganas dinero y cuando gastas en algo."],
                    ["Detalle de tus gastos", "Puedes ver la descripción de tus gastos para recordar su propósito."],
                    ["Control mensual", "Lleva el control total de tu dinero basado en ingresos y gastos del mes actual."]]
        default:
            return [["Guaranteed privacy", "All data is stored on the iPhone, never shared."],
                    ["Record your purchases", "Keep track of your total purchases."],
                    ["Income & expenses", "Write down when you get money and when you spend on anything."],
                    ["Details of your expenses", "You can see the description of your expenses to remember their purpose."],
                    ["Monthly control", "Keeps total control of money based on income and expenses in the current month."]]
        }
    }
    
    static var titleWhatsNew: String {
        switch getDeviceLanguage() {
        case "es":
            return "Bienvenido a \n Mi dinero"
        default:
            return "Welcome to \n My Money"
        }
    }
    static var compartir: String{
        switch getDeviceLanguage() {
        case "es":
            return "¡Mira esta sencilla aplicación para organizar tu dinero! Más información en:"
        default:
            return "Take a look at this easy app to organize your money! Find it at: "
        }
    }
    
}
