//
//  EditarPacienteViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 5/01/23.
//

import Foundation
import CoreData

class EditarPacienteViewModel: ObservableObject{
    let persitenContainer : NSPersistentContainer
    
    init(){
        self.persitenContainer = NSPersistentContainer(name: "Ejercicios_iOS")
        self.persitenContainer.loadPersistentStores { (description: NSPersistentStoreDescription, error: Error?) in
            if(error != nil){
                fatalError("No se puede cargar la base de Datos")
            }
        }
    }
    
    func actualizarPaciente(id:UUID, nombre:String, apellido:String, caso:String, edad: Int64, dni:Int64) async -> (){
        do{
            try actualizar(id: id, nombre: nombre, apellido: apellido, caso: caso, edad: edad, dni: dni)
        } catch{
            fatalError("Error no se pudo actualizar")
        }
    }
    
    private func actualizar(id:UUID, nombre:String, apellido:String, caso:String, edad: Int64, dni:Int64) throws -> (){
        let pacienteEntity = try getEntityById(id)!
        pacienteEntity.nombre = nombre
        pacienteEntity.apellido = apellido
        pacienteEntity.caso = caso
        pacienteEntity.edad = edad
        pacienteEntity.dni = dni
        saveContext()
    }
    
    private func getEntityById(_ id: UUID) throws -> PacienteEntity?{
        let request = PacienteEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id = %@", id.uuidString)
        let context = persitenContainer.viewContext
        let pacienteEntity = try context.fetch(request)[0]
        return pacienteEntity
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
