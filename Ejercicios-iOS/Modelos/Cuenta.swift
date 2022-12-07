//
//  Cuenta.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 5/12/22.
//

import Foundation

struct Cuenta: Identifiable{
    var id = UUID()
    var numero: Int
    var tipo: String
    var moneda: String
    var saldoActual: Double
    var dni: Int
}
