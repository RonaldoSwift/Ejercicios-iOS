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
                Text("Usuario")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color.black)
                
                Spacer()
                Image("Usuario")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250.0, height: 250.0, alignment: .center)
                    .clipShape(Circle())
                
                Spacer()
                
                NavigationLink(){
                    
                } label: {
                    Text("Registrar".uppercased())
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
