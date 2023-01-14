//
//  MenuPrincipalView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 11/01/23.
//

import SwiftUI

struct MenuPrincipalView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("Productos")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color.black)
                Image("Principal")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
                Spacer()
                
                NavigationLink {
                    CrearProductoView()
                } label: {
                    Text("Crear Producto")
                }
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                
                NavigationLink {
                    VerProductosView()
                } label: {
                    Text("Lista De Productos")
                }
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                
                NavigationLink {
                    ActualizarProductoView()
                } label: {
                    Text("Actualizar Producto")
                }
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                
                NavigationLink {
                    EliminarProductoView()
                } label: {
                    Text("Eliminar Producto")
                }
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                
                NavigationLink {
                    ReproducirMusicaView()
                } label: {
                    Text("Reproducir Musica")
                }
                .padding()
                .background(Color.black)
                .cornerRadius(10)
            }
            .padding()
            .background(Color.gray)
        }
    }
}

struct MenuPrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipalView()
    }
}
