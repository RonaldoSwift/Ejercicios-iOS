//
//  RegistrarView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 18/11/22.
//

import Foundation
import SwiftUI

struct RegistrarView: View{
    
    var body: some View{
        VStack{
            
            Text("BANCO CONTINENTAL BBVA")
                .foregroundColor(Color.white)
                .padding()
            
            Image("BBVAPrincipal")
                .resizable()
                .cornerRadius(10)
            
            Spacer()
            Button("REGISTRAR CLIENTE"){
                
            }
            .padding()
            .foregroundColor(Color.white)
            .background(Color("ColorBotones"))
            .cornerRadius(10)
            .padding()
            
            Button("REGISTRAR CUENTA"){
                
            }
            .padding()
            .foregroundColor(Color.white)
            .background(Color("ColorBotones"))
            .cornerRadius(10)
            .padding()
            
            Button("REALIZAR OPERACION"){
                
            }
            .padding()
            .foregroundColor(Color.white)
            .background(Color("ColorBotones"))
            .cornerRadius(10)
            .padding()
            
            Button("VER MOVIMIENTO"){
                
            }
            .padding()
            .foregroundColor(Color.white)
            .background(Color("ColorBotones"))
            .cornerRadius(10)
            
        }
        .padding()
        .background(Color("BlueFondo"))
    }
}

struct RegistrarView_Previews: PreviewProvider{
    
    static var previews: some View{
        RegistrarView()
    }
}
