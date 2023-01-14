//
//  PutProductosRequest.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 12/01/23.
//

import Foundation

struct PutProductosRequest: Encodable {
    let id: String
    let nombre: String
    let precio: Int
}
