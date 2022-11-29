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
            let alumnos = try await getAll()
            print(alumnos)
        }catch{
            
        }
    }
    
    private func getAll() throws -> [String]{
        let request = .fetchRequest()
    }
    
    func crearCliente(){
        
    }
    
    private func crear(){
        
    }
    
    private func saveContext(){
        
    }
//    TIENE 5 FUNCIONES: obtenerTodosLosAlumnos, getAll, crearCliente, crear, saveContext
}
