//
//  SharedViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 9/12/22.
//

import Foundation

class SharedViewModel: ObservableObject {
    @Published var dni: String = ""
    
    func guardarDni(dni: String) {
        self.dni = dni
    }
}
