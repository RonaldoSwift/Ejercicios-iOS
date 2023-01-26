//
//  SharedComidaViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 25/01/23.
//

import Foundation

class SharedComidaViewModel: ObservableObject{
    
    @Published var getComidasResponse: GetComidasResponse = GetComidasResponse.init(id: "", nombre: "", precio: 0)
    
    func guardarGetComidasResponse(getMusicasResponse: GetComidasResponse){
        self.getComidasResponse = getComidasResponse
    }
}
