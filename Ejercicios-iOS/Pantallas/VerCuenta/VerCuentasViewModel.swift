//
//  VerCuentasViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 2/12/22.
//

import Foundation
import CoreData
import SwiftUI

class VerCuentasViewModel{
    
    let persistenContainer : NSPersistentContainer
    
    init(){
        self.persistenContainer = NSPersistentContainer(name: "Ejercicios_iOS")
        self.persistenContainer.loadPersistentStores {(description: NSPersistentStoreDescription , error: Error?) in
            if error != nil {
                fatalError("No se pudo cargar la base de datos")
            }
        }
    }
    
    func obtenerTodasLasCuentas() async -> [Cuenta]{
        do{
            let cuentas = try getAll()
            return cuentas
        } catch{
            return []
        }
    }
    
    private func getAll() throws -> [Cuenta]{
        let request = CuentaEntity.fetchRequest()
        return try persistenContainer.viewContext.fetch(request).map({ (cuentaEntity : CuentaEntity)in
            Cuenta(numero: Int(cuentaEntity.numerocuenta),
                   tipo: cuentaEntity.tipocuenta ?? "Error!!! No se registro el tipo de cuenta",
                   moneda: cuentaEntity.moneda ?? "Error!!! No se registro el tipo de moneda",
                   saldoActual: Double(cuentaEntity.saldo),
                   dni: Int(cuentaEntity.dni))
        })
    }
    
    private func saveContext (){
        let context = persistenContainer.viewContext
        if(context.hasChanges){
            do{
                try context.save()
            } catch{
                fatalError("Error \(error.localizedDescription)")
            }
        }
    }
}
