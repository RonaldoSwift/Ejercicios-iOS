//
//  Ejercicios_iOSApp.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 7/11/22.
//

import SwiftUI

@main
struct Ejercicios_iOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
