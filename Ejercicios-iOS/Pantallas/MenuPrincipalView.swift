//
//  RegistrarView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 18/11/22.
//

import Foundation
import SwiftUI

struct MenuPrincipalView: View{
    
    var body: some View{
        NavigationView{
            VStack{
                Text("BANCO CONTINENTAL BBVA")
                    .foregroundColor(Color.white)
                    .padding()
                
                Image("BBVAPrincipal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                
                ScrollView{
                    Spacer()
                    NavigationLink("REGISTRAR CLIENTE") {
                        RegistrarClienteView()
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .frame (maxWidth: 300)
                    .background(Color("ColorBotones"))
                    .cornerRadius(10)
                    .padding()
                    
                    NavigationLink("REGISTRAR CUENTA") {
                        RegistrarCuentaView()
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .frame (maxWidth: 300)
                    .background(Color("ColorBotones"))
                    .cornerRadius(10)
                    .padding()
                    
                    NavigationLink("REALIZAR MOVIMIENTO") {
                        RealizarMovimientoView()
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .frame (maxWidth: 300)
                    .background(Color("ColorBotones"))
                    .cornerRadius(10)
                    .padding()
                    
                    NavigationLink("VER MOVIMIENTO") {
                        VerMovimientosView()
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .frame (maxWidth: 300)
                    .background(Color("ColorBotones"))
                    .cornerRadius(10)
                    .padding()
                    
                    NavigationLink("VER CLIENTES") {
                        VerClientesView()
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .frame (maxWidth: 300)
                    .background(Color("ColorBotones"))
                    .cornerRadius(10)
                    .padding()
                    Spacer()
                    NavigationLink("VER CUENTAS") {
                        VerCuentaView()
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .frame (maxWidth: 300)
                    .background(Color("ColorBotones"))
                    .cornerRadius(10)
                    .padding()
                }
            }
            .padding()
            .background(Color("BlueFondo"))
        }
        .navigationTitle("UPN")
    }
}

struct RegistrarView_Previews: PreviewProvider{
    static var previews: some View{
        MenuPrincipalView()
    }
}
