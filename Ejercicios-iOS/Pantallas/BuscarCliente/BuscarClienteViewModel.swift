//
//  BuscarClienteViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 14/12/22.
//

import Foundation
import CoreData


class BuscarClienteViewModel: ObservableObject {
    
    let persistenContainer : NSPersistentContainer
    
    init(){
        self.persistenContainer = NSPersistentContainer(name: "Ejercicios_iOS")
        self.persistenContainer.loadPersistentStores { (descripiton: NSPersistentStoreDescription, error: Error?) in
            if error != nil {
                fatalError("No se pudo cargar la base de datos")
            }
        }
    }
    
    func obtenerDatosDelClientePorDNI(dni:Int) async -> Cliente{
        do{
            let clienteEntity = try obtenerEntityPorDni(dni: dni)!
            return Cliente(
                dni: Int(clienteEntity.dni),
                nombre: clienteEntity.nombre!,
                direccion: clienteEntity.direccion!,
                distrito: clienteEntity.distrito!
            )
        } catch{
            fatalError("Error!!! No se encontro cliente")
        }
    }
    
    private func obtenerEntityPorDni(dni: Int) throws -> ClienteEntity?{
        let request = ClienteEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "dni = %@", dni)
        let context = persistenContainer.viewContext
        let clienteEntity = try context.fetch(request)[0]
        return clienteEntity
    }
    
    
}
