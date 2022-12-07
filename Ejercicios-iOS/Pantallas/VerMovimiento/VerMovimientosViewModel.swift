//
//  VerMovimientosViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 6/12/22.
//

import Foundation
import CoreData
import SwiftUI

class VerMovimientosViewModel {
    
    let persistenContainer : NSPersistentContainer
    
    init(){
        self.persistenContainer = NSPersistentContainer(name: "Ejercicios_iOS")
        self.persistenContainer.loadPersistentStores { (description: NSPersistentStoreDescription, error: Error?) in
            if error != nil {
                fatalError("No se puede cargar la base de datos")
            }
        }
    }
    
    func obtenerTodosLosMovimientos() async ->[Movimiento]{
        do{
            let movimiento = try getAll()
            return movimiento
        } catch{
            return []
        }
    }
    
    private func getAll() throws -> [Movimiento] {
        let request = MovimientoEntity.fetchRequest()
        return try persistenContainer.viewContext.fetch(request).map({ (movimientoEntity : MovimientoEntity) in
            Movimiento(
                numeroDeCuenta: Int(movimientoEntity.cuenta),
                fechaDeOperacion: movimientoEntity.fecha ?? "",
                descripcion: movimientoEntity.descripcion ?? "Error no description",
                numeroDeOperacion: Int(movimientoEntity.numerooperacion),
                tipoDeOperacion: movimientoEntity.tipooperacion ?? "Error",
                importe: movimientoEntity.importe,
                saldoContable: movimientoEntity.saldo
            )
        })
    }
    
    private func saveContext() {
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
