//
//  PutMusicasRequest.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 19/01/23.
//

import Foundation

struct PutMusicasRequest: Encodable{
    let id: String
    let titulo: String
    let url: String
}
