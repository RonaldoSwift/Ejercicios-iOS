//
//  MenuPrincipalView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 30/01/23.
//

import SwiftUI

struct MenuPrincipalView: View {
    var body: some View {
        NavigationView{
            VStack{
                Image("")
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                NavigationLink {
                    GrabarAudioView()
                } label: {
                    Text("GRABAR")
                }
                .padding()
                .frame(width: 300,height: 50)
                .foregroundColor(Color.white)
                .background(Color.black)
                .cornerRadius(10)
                
                NavigationLink {
                    ReproducirAudioView()
                } label: {
                    Text("REPRODUCIR")
                }
                .padding()
                .frame(width: 300,height: 50)
                .foregroundColor(Color.white)
                .background(Color.black)
                .cornerRadius(10)
                
                Spacer()
            }
            .padding()
            .background(Color("FondoPrincipal"))
            .navigationTitle("Menu Principal")
        }
    }
}

struct MenuPrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipalView()
    }
}
