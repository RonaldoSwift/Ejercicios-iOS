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
    
    private func getAll() throws -> [Usuario]{
        let request = UsuarioEntity.fetchRequest()
        return try persistenContainer.viewContext.fetch(request).map({
            (usuarioEntity: UsuarioEntity) in
            Usuario(
                nombre: usuarioEntity.nombre!,
                apellido: usuarioEntity.apellido!,
                dni: Int(usuarioEntity.dni),
                edad: Int(usuarioEntity.edad)
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
