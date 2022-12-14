//
//  RegistrarCuentaViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 1/12/22.
//

import Foundation
import CoreData

class RegistrarCuentaViewModel{
    
    let persistenContainer : NSPersistentContainer
    let numeroDeCuenta = Int.random(in: 1000000..<2000000)
    
    
    init(){
        self.persistenContainer = NSPersistentContainer(name: "Ejercicios_iOS")
        self.persistenContainer.loadPersistentStores { (description: NSPersistentStoreDescription, error: Error?) in
            if error != nil {
                fatalError("No se pudo cargar la base de datos")
            }
        }
    }
    
    func crearCuenta(tipoDeCuentaSelection: Int, monedaSelection: Int, saldo: Double, dni:Int) async {
        do{
            var tipoDeCuenta: String = ""
            var moneda: String = ""
            let saldo : Double = saldo
            let dni: Int = dni
            
            
            if(tipoDeCuentaSelection == 1){
                tipoDeCuenta = "Corriente"
            }
            else if(tipoDeCuentaSelection == 2){
                tipoDeCuenta = "Sueldo"
            }
            else{
                tipoDeCuenta = "Ahorros"
            }
            
            
            if(monedaSelection == 1){
                moneda = "Soles"
            }
            else{
                moneda = "Dolares"
            }
            
            try crear(numeroDeCuenta: numeroDeCuenta, tipoDeCuenta: tipoDeCuenta, moneda: moneda, saldo: saldo, dni: dni)
        } catch{
        }
    }
    
    //throws -> try
    private func crear(numeroDeCuenta: Int, tipoDeCuenta: String, moneda: String, saldo: Double, dni: Int) throws -> (){
        let cuentaEntity = CuentaEntity(context: persistenContainer.viewContext)
        cuentaEntity.id = Int64(Int.random(in: 1..<100))
        cuentaEntity.numerocuenta = Int64(numeroDeCuenta)
        cuentaEntity.tipocuenta = tipoDeCuenta
        cuentaEntity.moneda = moneda
        cuentaEntity.saldo = Int64(saldo)
        cuentaEntity.dni = Int64(dni)
        saveContext()
    }
    
    private func saveContext (){
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
