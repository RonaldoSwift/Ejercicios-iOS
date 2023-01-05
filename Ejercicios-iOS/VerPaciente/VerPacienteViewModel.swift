//
//  VerPacienteViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 29/12/22.
//

import Foundation
import CoreData

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
    
    func obtenerTodosLosPacientes() async -> [Paciente]{
        do{
            let paciente = try getAll()
            return paciente
        } catch{
            return []
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
