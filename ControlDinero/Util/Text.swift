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
            return ["Resumenes financieros",
                    "Configuraciones",
                    "Información de contacto",
                    "Comparte la app"]
//            ["Resumenes financieros (próximamente)",
//            "Información de contacto",
//            "Colaboradores",
//            "Comparte la app"]
        default:
            return ["Financial Summaries",
                    "Settings",
                    "Contact Information",
                    "Share the App"]
//            ["Financial Summaries (Coming Soon)",
//            "Contact Information",
//            "Collaborators",
//            "Share the App"]
        }
    }
    
    static var datosSeccionesInformacion: [[String]] {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        let build = dictionary["CFBundleVersion"] as! String
        switch getDeviceLanguage() {
        case "es":
            return [["Gráficas", "Resumen mensual", "Estadísticas"],
                    ["Recordatorio de notificación"],
                    ["Sugerencias o contacto", "Desarrollador de la app", "Suscríbete a mi canal"],
                    ["Compartela con tus amigos", "Ver en la App Store", "v: \(version) (\(build))"]]
//            [["Gráficas", "Resumen mensual", "Estadísticas"],
//            ["Sugerencias o contacto", "Desarrollador de la app"],
//            ["@SSfsd(Diseño)", "@dsasa  (traducción Frances)"],
//            ["Compartela con tus amigos", "Ver en la App Store"]]
        default:
            return [["Charts", "Monthly Summary", "Statistics"],
                    ["Notification reminder"],
                    ["Suggestions/contact", "App Developer", "Suscribe to my channel"],
                    ["Tell your friends", "Watch on the App Store", "v: \(version) (\(build))"]]
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
    
    static var tituloProximamente: String{
        switch getDeviceLanguage() {
        case "es":
            return "¡Este contenido estará disponible muy pronto!"
        default:
            return "This feature will be released very soon!"
        }
    }
    
    static var mensajeProximamente: String{
        switch getDeviceLanguage() {
        case "es":
            return "Estoy trabajando en ello para darte una mejor experiencia, mantente atento a las actualizaciones 😉"
        default:
            return "I'm working on it to give you a better experience, stay tuned for updates 😉"
        }
    }
    
    static var tituloAlertNotificacion: String {
        switch getDeviceLanguage() {
        case "es":
            return "Horario de notificación actualizado"
        default:
            return "Notification reminder has been updated"
        }
    }
    static var mensajeAlertNotificacion: String {
        switch getDeviceLanguage() {
        case "es":
            return "Se mandará un recordatorio todos los días a las "
        default:
            return "You will be notified every day at "
        }
    }
    
    static var tituloNotificacion: String {
        switch getDeviceLanguage() {
        case "es":
            return "Registra tus movimientos del día"
        default:
            return "Record your daily movements"
        }
    }
    
    static var bodyNotificacion: String {
        switch getDeviceLanguage() {
        case "es":
            return "Abre la app y lleva el control de lo que gastaste hoy :)"
        default:
            return "Open the app and keep track of what you spent today :)"
        }
    }
    static var fileNameGanacias: String {
        switch getDeviceLanguage() {
        case "es":
            return "Ingresos_\(getCurrentDate()).csv"
        default:
            return "Earnings_\(getCurrentDate()).csv"
        }
    }
    static var fileNameGanaciasGlobal: String {
        switch getDeviceLanguage() {
        case "es":
            return "Ingresos_historial.csv"
        default:
            return "Earnings_history.csv"
        }
    }
    static var fileFieldsGanacias: [String] {
        switch getDeviceLanguage() {
        case "es":
            return ["#", "Fecha", "Total", "Detalles"]
        default:
            return ["#", "Date", "Total", "Details"]
        }
    }
    static var fileNameGastos: String {
        switch getDeviceLanguage() {
        case "es":
            return "Gastos_\(getCurrentDate()).csv"
        default:
            return "Expenses_\(getCurrentDate()).csv"
        }
    }
    static var fileNameGastosGlobal: String {
        switch getDeviceLanguage() {
        case "es":
            return "Gastos_historial.csv"
        default:
            return "Expenses_history.csv"
        }
    }
    static var fileFieldsGastos: [String] {
        switch getDeviceLanguage() {
        case "es":
            return ["#", "Nombre", "Fecha", "Total", "Detalles", "Mes"]
        default:
            return ["#", "Name", "Date", "Total", "Details", "Month"]
        }
    }
}
