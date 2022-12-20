//
//  Usuario.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 19/12/22.
//

import Foundation

struct Usuario: Identifiable{
    var id: UUID
    var nombre: String
    var apellido: String
    var dni: Int
    var edad: Int
}
