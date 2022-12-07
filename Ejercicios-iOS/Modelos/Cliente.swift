//
//  Cliente.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 5/12/22.
//

import Foundation

struct Cliente: Identifiable{
    var id = UUID()
    var dni: Int
    var nombre: String
    var direccion: String
    var distrito: String
}
