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
                    .cornerRadius(20)
                
                Spacer()
                NavigationLink("REGISTRAR CLIENTE") {
                    RegistrarClienteView()
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color("ColorBotones"))
                .cornerRadius(10)
                .padding()
                
                NavigationLink("REGISTRAR CUENTA") {
                    RegistrarCuentaView()
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color("ColorBotones"))
                .cornerRadius(10)
                .padding()
                
                
                NavigationLink("REALIZAR OPERACION") {
                    
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color("ColorBotones"))
                .cornerRadius(10)
                .padding()
                
                
                NavigationLink("VER MOVIMIENTO") {
                    
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color("ColorBotones"))
                .cornerRadius(10)
                .padding()
                
            }
            .padding()
            .background(Color("BlueFondo"))
        }
    }
}

struct RegistrarView_Previews: PreviewProvider{
    
    static var previews: some View{
        MenuPrincipalView()
    }
}
