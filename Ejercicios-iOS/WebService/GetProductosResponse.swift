//
//  GetProductosResponse.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 11/01/23.
//

import Foundation

struct GetProductosResponse: Decodable{
    let id: String
    let nombre: String
    let precio: Int
}
