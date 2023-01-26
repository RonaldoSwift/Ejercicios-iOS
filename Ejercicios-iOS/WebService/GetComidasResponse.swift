//
//  GetComidasResponse.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 25/01/23.
//

import Foundation

struct GetComidasResponse: Decodable{
    let id:String
    let nombre: String
    let precio: Int
}
