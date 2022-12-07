//
//  RealizarMovimientoViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 6/12/22.
//

import Foundation
import CoreData

class RealizarMovimientoViewModel{
    
    let persistenContainer : NSPersistentContainer
    
    init(){
        self.persistenContainer = NSPersistentContainer(name: "Ejercicios_iOS")
        self.persistenContainer.loadPersistentStores { (description: NSPersistentStoreDescription, error: Error?) in
            if error != nil{
                fatalError("No se pudo cargar la base de Datos")
            }
        }
    }
    
    
    func crearMovimiento(descripcion: String, selection: Int, importe: Double) async{
        do{
            let numeroDeCuenta : Int = 0
            
            //OBTENER FECHA
            let fechaOperacion : Date = Date()
            let formatoFecha = DateFormatter()
            formatoFecha.dateStyle = .full
            formatoFecha.timeStyle = .none
            let fechaQueSeMuestra = formatoFecha.string(from: fechaOperacion)
            
            
            let numeroOperacion = Int.random(in: 1..<100)
            
            let saldo : Double = 0.0
            
            
            var tipoOperacion : String = ""
            if(selection == 1){
                tipoOperacion = "D"
            }
            else{
                tipoOperacion = "R"
            }
            
            try crear(numeroDeCuenta: numeroDeCuenta, fechaDeOperacion: fechaQueSeMuestra, descripcion: descripcion, numeroDeOperacion: numeroOperacion, tipoDeOperacion: tipoOperacion, importe: importe, saldoContable: saldo)
            
        } catch{
            
        }
    }
    
    private func crear(numeroDeCuenta: Int, fechaDeOperacion: String, descripcion: String, numeroDeOperacion: Int, tipoDeOperacion: String, importe: Double, saldoContable: Double) throws -> (){
        let movimientoEntity = MovimientoEntity(context: persistenContainer.viewContext)
        movimientoEntity.id = 1
        movimientoEntity.cuenta = Int64(numeroDeCuenta)
        movimientoEntity.fecha = fechaDeOperacion
        movimientoEntity.descripcion = descripcion
        movimientoEntity.numerooperacion = Int64(numeroDeCuenta)
        movimientoEntity.tipooperacion = tipoDeOperacion
        movimientoEntity.importe = importe
        movimientoEntity.saldo = saldoContable
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
