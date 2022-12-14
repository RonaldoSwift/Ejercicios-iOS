//
//  SharedViewModel.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 9/12/22.
//

import Foundation

class SharedViewModel: ObservableObject {
    
    @Published var dni: Int = 0
    @Published var numeroDeCuenta: Int = 0
    @Published var saldoActual: Double = 0
    
    func guardarDni(dni: Int) {
        self.dni = dni
    }
    
    func guardarNumeroDeCuenta(numeroDeCuenta:Int){
        self.numeroDeCuenta = numeroDeCuenta
    }
    
    func guardarSaldoActual(saldoActual: Double){
        self.saldoActual = saldoActual
    }
}
