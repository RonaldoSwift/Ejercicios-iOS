//
//  VerUsuarioViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 19/12/22.
//

import Foundation
import CoreData

class VerUsuarioViewModel {
    
    let persistenContainer : NSPersistentContainer
    
    init(){
        self.persistenContainer = NSPersistentContainer(name: "Ejercicios_iOS")
        self.persistenContainer.loadPersistentStores { (description: NSPersistentStoreDescription, error:Error?) in
            if error != nil {
                fatalError("No se puede cargar la base de datos")
            }
        }
    }
    
    func obtenerTodosLosUsuarios() async -> [Usuario]{
        do{
            let usuario = try getAll()
            return usuario
        } catch{
            return []
        }
    }
    
    
    func eliminarUsuario(_ id: UUID) async -> (){
        do{
            try eliminar(id)
        } catch{
            fatalError("Error no se pudo eliminar")
        }
    }
    
    private func eliminar(_ id: UUID) throws -> (){
        let usuarioEntity = try getEntityById(id)!
        let context = persistenContainer.viewContext
        context.delete(usuarioEntity)
        do{
            try context.save()
        } catch{
            context.rollback()
            fatalError("Error \(error.localizedDescription)")
        }
    }
    
    private func getAll() throws -> [Usuario]{
        let request = UsuarioEntity.fetchRequest()
        return try persistenContainer.viewContext.fetch(request).map({
            (usuarioEntity: UsuarioEntity) in
            Usuario(
                id: usuarioEntity.id!,
                nombre: usuarioEntity.nombre!,
                apellido: usuarioEntity.apellido!,
                dni: Int(usuarioEntity.dni),
                edad: Int(usuarioEntity.edad)
            )
        })
    }
    
    private func getEntityById(_ id: UUID) throws -> UsuarioEntity?{
        let request = UsuarioEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id = %@", id.uuidString)
        let context = persistenContainer.viewContext
        let usuarioEntity = try context.fetch(request)[0]
        return usuarioEntity
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
