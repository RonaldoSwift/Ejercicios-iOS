//
//  GetMusicasResponse.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 16/01/23.
//

import Foundation

struct GetMusicasResponse: Decodable{
    let id: String
    let titulo: String
    let url: String
}
