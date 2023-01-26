//
//  MenuPrincipalView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 25/01/23.
//

import SwiftUI

struct MenuPrincipalView: View {
    var body: some View {
        NavigationView{
            VStack{
                Image("MenuPrincipal")
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                NavigationLink {
                    CrearComidaView()
                } label: {
                    Text("CREAR COMIDA")
                }
                .padding()
                .frame(width: 300, height: 50)
                .foregroundColor(Color.black)
                .background(Color("Botones"))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                
                NavigationLink {
                    VerComidaView()
                } label: {
                    Text("VER COMIDA")
                }
                .padding()
                .frame(width: 300, height: 50)
                .foregroundColor(Color.black)
                .background(Color("Botones"))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                
                NavigationLink {
                    ActualizarComidaView()
                } label: {
                    Text("ACTUALIZAR COMIDA")
                }
                .padding()
                .frame(width: 300, height: 50)
                .foregroundColor(Color.black)
                .background(Color("Botones"))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                
                Spacer()
            }
            .padding()
            .background(Color("FondoPrincipal"))
            .navigationTitle("COMIDA")
        }
    }
}

struct MenuPrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipalView()
    }
}
