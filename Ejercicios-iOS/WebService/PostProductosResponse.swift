//
//  PostProductosResponse.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 11/01/23.
//

import Foundation

struct PostProductosResponse: Decodable{
    let id: String
    let nombre: String
    let precio: Int
}
