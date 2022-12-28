//
//  EditarUsuarioViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 22/12/22.
//

import Foundation
import CoreData

class EditarUsuarioViewModel: ObservableObject{
    
    let persitenContainer : NSPersistentContainer
    
    init(){
        self.persitenContainer = NSPersistentContainer(name: "Ejercicios_iOS")
        self.persitenContainer.loadPersistentStores { (description: NSPersistentStoreDescription, error: Error? ) in
            if(error != nil) {
                fatalError("No se puede cargar la base de Datos")
            }
        }
    }
    
    func actualizarUsuario(
        id: UUID,
        nombre: String,
        apellido:String,
        dni: Int64,
        edad: Int64
    ) async -> (){
        do{
            try actualizar(id: id, nombre:nombre, apellido:apellido, dni:dni, edad:edad)
        } catch{
            fatalError("Error no se pudo actualizar")
        }
    }
    
    private func actualizar(id: UUID, nombre: String, apellido: String, dni:Int64, edad: Int64) throws -> (){
        let usuarioEntity = try getEntityById(id)!
        usuarioEntity.nombre = nombre
        usuarioEntity.apellido = apellido
        usuarioEntity.dni = dni
        usuarioEntity.edad = edad
        saveContext()
    }
    
    private func getEntityById(_ id: UUID) throws -> UsuarioEntity?{
        let request = UsuarioEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id = %@", id.uuidString)
        let context = persitenContainer.viewContext
        let usuarioEntity = try context.fetch(request)[0]
        return usuarioEntity
    }
    
    private func saveContext(){
        let context = persitenContainer.viewContext
        if(context.hasChanges){
            do{
                try context.save()
            } catch{
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    
}
