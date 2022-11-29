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
    
    //    TIENE 5 FUNCIONES: obtenerTodosLosAlumnos, getAll, crearCliente, crear, saveContext
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
    
    func crearCliente(nombre: String, codigo: String) async{
        do{
            try await crear(nombreAlumno: nombre, codigoDeAlumno: codigo)
        } catch{
            
        }
    }
    
    private func crear(nombreAlumno: String, codigoDeAlumno: String) throws -> (){
        let alumnoEntity = AlumnoEntity(context: persistenContainer.viewContext)
        alumnoEntity.id = 1
        alumnoEntity.nombre = nombreAlumno
        alumnoEntity.codigo = codigoDeAlumno
        saveContext()
    }
    
    private func saveContext(){
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
