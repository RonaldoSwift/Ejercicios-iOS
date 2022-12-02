//
//  RegistrarClienteViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 23/11/22.
//

import Foundation
import CoreData
class RegistrarClienteViewModel{
    
    let persistenContainer : NSPersistentContainer
    
    init(){
        self.persistenContainer = NSPersistentContainer(name: "Ejercicios_iOS")
        self.persistenContainer.loadPersistentStores { (descripiton: NSPersistentStoreDescription, error: Error?) in
            if error != nil {
                fatalError("No se pudo cargar la base de datos")
            }
        }
    }
    
    func crearCliente(dni:Int, nombreCliente:String, direccion:String, distrito:String) async {
        do{
            try crear(dni: dni, nombreCliente: nombreCliente, direccion: direccion, distrito: distrito)
        } catch{
            
        }
    }
    
    private func crear(dni:Int, nombreCliente:String, direccion:String, distrito:String) throws -> (){
        let clienteEntity = ClienteEntity(context: persistenContainer.viewContext)
        clienteEntity.id = 1
        clienteEntity.dni = Int64(dni)
        clienteEntity.nombre = nombreCliente
        clienteEntity.direccion = direccion
        clienteEntity.distrito = distrito
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
