//
//  AgregarPacienteViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 29/12/22.
//

import Foundation
import CoreData

class AgregarPacienteViewModel: ObservableObject {
    
    let persistenContainer : NSPersistentContainer
    
    init(){
        self.persistenContainer = NSPersistentContainer(name: "Ejercicios_iOS")
        self.persistenContainer.loadPersistentStores { (description: NSPersistentStoreDescription, error: Error?) in
            if(error != nil){
                fatalError("No se puede cargar la base de Datos")
            }
        }
    }
    
    func crearPaciente(id: UUID,nombre:String, apellido:String, caso:String, edad:Int, dni:Int) async{
        do{
            try crear( id: id, nombre: nombre, apellido: apellido, caso: caso, edad: edad, dni: dni)
        } catch{
            fatalError("No se pudo agregar Paciente")
        }
    }
    
    private func crear(id: UUID, nombre:String, apellido:String, caso: String, edad: Int, dni: Int) throws -> (){
        let pacienteEntity = PacienteEntity(context: persistenContainer.viewContext)
        pacienteEntity.id = id
        pacienteEntity.nombre = nombre
        pacienteEntity.apellido = apellido
        pacienteEntity.caso = caso
        pacienteEntity.edad = Int64(edad)
        pacienteEntity.dni = Int64(dni)
        saveContext()
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
