//
//  VerCuentasViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 2/12/22.
//

import Foundation
import CoreData

class VerCuentasViewModel{
    
    let persistenContainer : NSPersistentContainer
    
    init(){
        self.persistenContainer = NSPersistentContainer(name: "Ejercicios_iOS")
        self.persistenContainer.loadPersistentStores {(description: NSPersistentStoreDescription , error: Error?) in
            if error != nil {
                fatalError("No se pudo caragr la base de datos")
            }
        }
    }
    
    func obtenerTodasLasCuentas() async -> [String]{
        do{
            let cuentas = try getAll()
            return cuentas
        } catch{
            return []
        }
    }
    
    private func getAll() throws -> [String]{
        let request = CuentaEntity.fetchRequest()
        return try persistenContainer.viewContext.fetch(request).map({ (cuentaEntity : CuentaEntity)in
            cuentaEntity.numerocuenta!
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
