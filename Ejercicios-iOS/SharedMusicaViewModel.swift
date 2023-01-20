//
//  SharedMusicaViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 20/01/23.
//

import Foundation

class SharedMusicaViewModel: ObservableObject{
    
    @Published var getMusicasResponse: GetMusicasResponse = GetMusicasResponse.init(id: "", titulo: "", url: "")
    
    func guardarGetMusicasResponse(getMusicasResponse: GetMusicasResponse){
        self.getMusicasResponse = getMusicasResponse
    }
}
