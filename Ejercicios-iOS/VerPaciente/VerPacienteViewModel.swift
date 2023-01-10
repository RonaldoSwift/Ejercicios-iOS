//
//  VerPacienteViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 29/12/22.
//

import Foundation
import CoreData
import Alamofire

class VerPacienteViewModel : ObservableObject{
    
    let persistenContainer : NSPersistentContainer
    
    init(){
        self.persistenContainer = NSPersistentContainer(name: "Ejercicios_iOS")
        self.persistenContainer.loadPersistentStores {(description: NSPersistentStoreDescription, error: Error?) in
            if error != nil {
                fatalError("No se pudo caragr la base de datos")
            }
        }
    }
    
    //Metodos para CoreData
    
    func eliminarPaciente(_ id: UUID) async -> (){
        do{
            try eliminar(id)
        } catch{
            fatalError("Error no se pudo eliminar")
        }
    }
    
    func obtenerTodosLosPacientes() async -> [Paciente]{
        do{
            let pacientes = try getAll()
            return pacientes
        } catch{
            return []
        }
    }
    
    private func eliminar(_ id: UUID) throws -> (){
        let pacienteEntity = try getEntityById(id)!
        let context = persistenContainer.viewContext
        context.delete(pacienteEntity)
        do{
            try context.save()
        } catch{
            context.rollback()
            fatalError("Error \(error.localizedDescription)")
        }
    }
    
    
    private func getAll() throws ->[Paciente]{
        let request = PacienteEntity.fetchRequest()
        return try persistenContainer.viewContext.fetch(request).map({
            (pacienteEntity : PacienteEntity) in
            Paciente(
                id: pacienteEntity.id!,
                nombre: pacienteEntity.nombre!,
                apellido: pacienteEntity.apellido!,
                caso: pacienteEntity.caso!,
                edad: Int(pacienteEntity.edad),
                dni: Int(pacienteEntity.dni)
            )
        })
    }
    
    private func getEntityById(_ id: UUID) throws -> PacienteEntity?{
        let request = PacienteEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id = %@", id.uuidString)
        let context = persistenContainer.viewContext
        let pacienteEntity = try context.fetch(request)[0]
        return pacienteEntity
    }
    
    private func saveContext(){
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
