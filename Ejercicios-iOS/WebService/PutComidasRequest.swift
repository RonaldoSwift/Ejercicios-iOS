//
//  PutComidasRequest.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 25/01/23.
//

import Foundation

struct PutComidasRequest: Encodable{
    let id:String
    let nombre: String
    let precio: Int
}
