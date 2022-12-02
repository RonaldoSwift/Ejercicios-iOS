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
    
    func crearCuenta(cuenta: String, tipo: String, moneda: String, saldo: String, dni: Int) async {
        do{
            try crear(cuenta: cuenta, tipo: tipo, moneda: moneda, saldo: saldo, dni: dni)
        } catch{
        }
    }
    
    //throws -> try
    private func crear(cuenta: String, tipo: String, moneda: String, saldo: String, dni: Int) throws -> (){
        let cuentaEntity = CuentaEntity(context: persistenContainer.viewContext)
        cuentaEntity.id = 1
        cuentaEntity.numerocuenta = cuenta
        cuentaEntity.tipocuenta = tipo
        cuentaEntity.moneda = moneda
        cuentaEntity.saldo = saldo
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
