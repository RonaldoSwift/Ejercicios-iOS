//
//  RegistrarAlumnoViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 25/11/22.
//

import Foundation
import CoreData

struct RegistrarAlumnoViewModel{
    
    let persistenContainer : NSPersistentContainer
    
    init(){
        self.persistenContainer = NSPersistentContainer(name: "Ejercicios_iOS")
        self.persistenContainer.loadPersistentStores { (description: NSPersistentStoreDescription, error: Error?) in
            if error != nil{
                fatalError("No se pudo cargar la base de Datos")
            }
        }
    }
    
    func obtenerTodosLosAlumnos() async {
        do{
            let nombredealumnos = try await getAll()
            print(nombredealumnos)
        }catch{
            
        }
    }
    
    private func getAll() throws -> [String]{
        let request = AlumnoEntity.fetchRequest()
        //map= tranformaciones de un tipo de dato a otro
        return try persistenContainer.viewContext.fetch(request).map({ (alumnoEntity: AlumnoEntity) in
            alumnoEntity.nombre!
        })
        
    }
    
    func crearCliente(){
        
    }
    
    private func crear(){
        
    }
    
    private func saveContext(){
        
    }
    //    TIENE 5 FUNCIONES: obtenerTodosLosAlumnos, getAll, crearCliente, crear, saveContext
}
