//
//  MenuPrincipalView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 29/12/22.
//

import SwiftUI

struct MenuPrincipalView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("HOSPITAL 2 DE MAYO")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color.black)
                
                Image("HospitalMenu")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
                Spacer()
                
                NavigationLink {
                    AgregarPacienteView()
                } label: {
                    Text("REGISTRAR PACIENTE".uppercased())
                        .padding()
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
                .foregroundColor(Color.white)
                .frame (maxWidth: 300)
                .background(Color.black)
                .cornerRadius(10)
                .padding()
                
                NavigationLink {
                    VerPacienteView()
                } label: {
                    Text("REGISTRO DE PACIENTE".uppercased())
                        .padding()
                        .shadow(radius: 10)
                        .cornerRadius(10)
                    
                }
                .foregroundColor(Color.white)
                .frame (maxWidth: 300)
                .background(Color.black)
                .cornerRadius(10)
                .padding()
                
                Spacer()
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
