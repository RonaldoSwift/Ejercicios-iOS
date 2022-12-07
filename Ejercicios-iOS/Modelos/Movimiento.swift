//
//  Movimiento.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 5/12/22.
//

import Foundation

struct Movimiento: Identifiable{
    var id = UUID()
    var numeroDeCuenta: Int
    var fechaDeOperacion: String
    var descripcion: String
    var numeroDeOperacion: Int
    var tipoDeOperacion: String
    var importe: Double
    var saldoContable: Double
}
