//
//  Ejercicios_iOSApp.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 7/11/22.
//

import SwiftUI

@main
struct Ejercicios_iOSApp: App {
    var sharedComidaViewModel: SharedComidaViewModel = SharedComidaViewModel()
    
    var body: some Scene {
        WindowGroup {
            MenuPrincipalView()
                .environmentObject(sharedComidaViewModel)
        }
    }
}
