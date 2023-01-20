//
//  Ejercicios_iOSApp.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 7/11/22.
//

import SwiftUI

@main
struct Ejercicios_iOSApp: App {

    var sharedMusicaViewModel: SharedMusicaViewModel = SharedMusicaViewModel()
    
    var body: some Scene {
        WindowGroup {
            MenuPrincipalView()
                .environmentObject(sharedMusicaViewModel)
        }
    }
}
