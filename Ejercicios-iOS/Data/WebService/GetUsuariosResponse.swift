//
//  GetUsuariosResponse.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 6/01/23.
//

import Foundation
struct GetUsuariosResponse: Decodable{
    let id: Int
    let nombre: String
    let apellido: String
    let telefono: Int
}
