//
//  PostMusicasRequest.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 18/01/23.
//

import Foundation

struct PostMusicasRequest: Encodable{
    let id: String
    let titulo: String
    let url: String
}
