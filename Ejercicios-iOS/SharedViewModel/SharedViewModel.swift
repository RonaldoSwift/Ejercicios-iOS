//
//  SharedViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 30/01/23.
//

import Foundation

class SharedViewModel:ObservableObject{
    
    @Published var url: URL? = nil
    
    func guardarURL(url:URL){
        self.url = url
    }
}
