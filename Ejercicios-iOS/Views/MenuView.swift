//
//  MenuView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 25/11/22.
//

import Foundation
import SwiftUI

struct MenuView: View{
    var body: some View{
        NavigationView{
            VStack(alignment: .center){
                Text("UPN")
                Text("BIENVENIDO AL REGISTRO DE LA UNIVERSIDAD PRIVADA DEL NORTE")
                Image("")
                Spacer()
                NavigationLink("Registrar") {
                    RegistrarAlumnoView()
                }
                .padding()
                .foregroundColor(Color.black)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding()
            .background(Color.red)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

