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
    
    func obtenerDatosDeLaCuentaPordni(dni: Int) async -> Cuenta{
        do{
            let cuentaEntity = try obtenerEntityPorNumeroDeCuenta(dni: dni)
            return Cuenta(numero: Int(cuentaEntity!.numerocuenta),
                          tipo: cuentaEntity!.tipocuenta!,
                          moneda: cuentaEntity!.moneda!,
                          saldoActual: cuentaEntity!.saldo,
                          dni: Int(cuentaEntity!.dni)
            )
        } catch{
            fatalError("Error!!! No se encontro la cuenta")
        }
    }
    
    func obtenerDatosDelMovimientoPorNumeroDeCuenta(numeroDeCuenta: Int) async -> [Movimiento]{
        do{
            let movimientosEntity = try obtenerMovimientosEntityPorNumeroDeCuenta(numeroDeCuenta: numeroDeCuenta)
            return movimientosEntity.map { (movimientoEntity : MovimientoEntity) in
                Movimiento(
                    numeroDeCuenta: Int(movimientoEntity.cuenta),
                    fechaDeOperacion: movimientoEntity.fecha!,
                    descripcion: movimientoEntity.descripcion!,
                    numeroDeOperacion: Int(movimientoEntity.numerooperacion),
                    tipoDeOperacion: movimientoEntity.tipooperacion!,
                    importe: movimientoEntity.importe,
                    saldoContable: movimientoEntity.saldo
                )
            }
        } catch{
            fatalError("Error!!! No se encontro Movimiento de Cliente")
        }
    }
    
    
    private func obtenerEntityPorDni(dni: Int) throws -> ClienteEntity?{
        let request = ClienteEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "dni = %d", dni)
        let context = persistenContainer.viewContext
        let clienteEntity = try context.fetch(request)[0]
        return clienteEntity
    }
    
    private func obtenerEntityPorNumeroDeCuenta(dni: Int) throws -> CuentaEntity?{
        let request = CuentaEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "dni = %d", dni)
        let context = persistenContainer.viewContext
        let cuentaEntity = try context.fetch(request)[0]
        return cuentaEntity
    }
    
    private func obtenerMovimientosEntityPorNumeroDeCuenta(numeroDeCuenta: Int) throws -> [MovimientoEntity]{
        let request = MovimientoEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "cuenta = %d", numeroDeCuenta)
        let context = persistenContainer.viewContext
        let movimientoEntity = try context.fetch(request)
        return movimientoEntity
    }
}
