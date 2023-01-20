//
//  MenuPrincipalView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 16/01/23.
//

import SwiftUI

struct MenuPrincipalView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("REPRODUCCION")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color.black)
                Image("MenuPrincipalImage")
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                NavigationLink {
                    CrearMusicaView()
                } label: {
                    Text("Crear Musica")
                }
                .padding()
                .background(Color("FondoBotones"))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                
                NavigationLink {
                    VerMusicasView()
                } label: {
                    Text("Lista De Reproduccion")
                }
                .padding()
                .background(Color("FondoBotones"))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                
                NavigationLink {
                    ActualizarMusicaView()
                } label: {
                    Text("Actualizar Musica")
                }
                .padding()
                .background(Color("FondoBotones"))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                
                
                NavigationLink {
                    EliminarMusicaView()
                } label: {
                    Text("Eliminar Musica")
                }
                .padding()
                .background(Color("FondoBotones"))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                
                Spacer()
            }
            .padding()
            .background(Color("FondoPrincipal"))
        }
    }
}

struct MenuPrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipalView()
    }
}
