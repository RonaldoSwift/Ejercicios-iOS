//
//  RegistrarUsuarioViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 19/12/22.
//

import Foundation
import CoreData

class RegistrarUsuarioViewModel: ObservableObject{
    //Propiedad
    let persitenContainer : NSPersistentContainer
    
    //Constructor
    init(){
        self.persitenContainer = NSPersistentContainer(name: "Ejercicios_iOS")
        self.persitenContainer.loadPersistentStores { (description: NSPersistentStoreDescription, error: Error? ) in
            if(error != nil) {
                fatalError("No se puede cargar la base de Datos")
            }
        }
    }
    
    //Funciones
    
    func crearCliente(nombre: String, apellido:String, dni:Int, edad:Int) async {
        do{
            try crear(nombre: nombre, apellido: apellido, dni: dni, edad: edad)
        } catch{
            fatalError("No se puedo ingresar ala lista")
        }
    }
    
    private func crear(nombre:String, apellido:String, dni: Int, edad:Int) throws -> (){
        let usuarioEntity = UsuarioEntity(context: persitenContainer.viewContext)
        usuarioEntity.id = UUID()
        usuarioEntity.nombre = nombre
        usuarioEntity.apellido = apellido
        usuarioEntity.dni = Int64(dni)
        usuarioEntity.edad = Int64(edad)
        saveContext()
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
