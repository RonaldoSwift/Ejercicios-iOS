//
//  MenuPrincipalView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 19/12/22.
//

import SwiftUI

struct MenuPrincipalView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("Menu")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color.black)
                
                Spacer()
                Image("Usuario")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 360.0, height: 250.0, alignment: .center)
                
                Spacer()
                
                NavigationLink(){
                    RegistrarUsuarioView()
                } label: {
                    Text("Bienvenido".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
            }
            .padding()
            .background(Color("ColorFondoPrincipal"))
        }
    }
}

struct MenuPrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipalView()
    }
}
