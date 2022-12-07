//
//  RegistrarCuentaViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 1/12/22.
//

import Foundation
import CoreData

class RegistrarCuentaViewModel{
    
    let persistenContainer : NSPersistentContainer
    
    init(){
        self.persistenContainer = NSPersistentContainer(name: "Ejercicios_iOS")
        self.persistenContainer.loadPersistentStores { (description: NSPersistentStoreDescription, error: Error?) in
            if error != nil {
                fatalError("No se pudo cargar la base de datos")
            }
        }
    }
    
    func crearCuenta(cuenta: Int,selection: Int, selection2: Int ,tipo: String, moneda: String, dni: Int) async {
        do{
            let saldo : Double = 0.0
            //
            var tipo: String = ""
            
            if(selection == 1){
                tipo = "Corriente"
            }
            else if(selection == 2){
                tipo = "Sueldo"
            }
            else{
                tipo = "Ahorros"
            }
            //
            var moneda: String = ""
            
            if(selection2 == 1){
                moneda = "Soles"
            }
            else{
                moneda = "Dolares"
            }
            
            try crear(cuenta: cuenta, tipo: tipo, moneda: moneda, saldo: saldo, dni: dni)
        } catch{
        }
    }
    
    //throws -> try
    private func crear(cuenta: Int, tipo: String, moneda: String, saldo: Double, dni: Int) throws -> (){
        let cuentaEntity = CuentaEntity(context: persistenContainer.viewContext)
        cuentaEntity.id = 1
        cuentaEntity.numerocuenta = Int64(cuenta)
        cuentaEntity.tipocuenta = tipo
        cuentaEntity.moneda = moneda
        cuentaEntity.saldo = Int64(saldo)
        cuentaEntity.dni = Int64(dni)
        saveContext()
    }
    
    private func saveContext (){
        let context = persistenContainer.viewContext
        if(context.hasChanges){
            do{
                try context.save()
            } catch{
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}
