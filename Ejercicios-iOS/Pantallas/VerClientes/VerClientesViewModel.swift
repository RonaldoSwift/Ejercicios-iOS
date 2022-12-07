//
//  VerClientesViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 30/11/22.
//

import Foundation
import CoreData
import SwiftUI
class VerClientesViewModel{
    
    let persistenContainer : NSPersistentContainer
    
    init(){
        self.persistenContainer = NSPersistentContainer(name: "Ejercicios_iOS")
        self.persistenContainer.loadPersistentStores { (descripiton: NSPersistentStoreDescription, error: Error?) in
            if error != nil {
                fatalError("No se pudo cargar la base de datos")
            }
        }
    }
    
    func obtenrTodosLosClientes() async -> [Cliente]{
        do{
            let clientes = try getAll()
            return clientes
        }catch{
            return []
        }
    }
    
    private func getAll() throws -> [Cliente] {
        let request = ClienteEntity.fetchRequest()
        return try persistenContainer.viewContext.fetch(request).map({ (clienteEntity :ClienteEntity) in
            Cliente(dni: Int(clienteEntity.dni),
                    nombre: clienteEntity.nombre ?? "Error!!! no se encontro el nombre",
                    direccion: clienteEntity.direccion ?? "Error!!! no se encontro la direccion",
                    distrito: clienteEntity.distrito ?? "Error!!! no se encontro el distrio")
        })
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
