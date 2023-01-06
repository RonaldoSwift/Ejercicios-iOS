//
//  Ejercicios_iOSApp.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 7/11/22.
//

import SwiftUI

@main
struct Ejercicios_iOSApp: App {
    var sharedViewModel : SharedViewModel = SharedViewModel()

    var body: some Scene {
        WindowGroup {
            MenuPrincipalView()
                .environmentObject(sharedViewModel)
        }
    }
}
