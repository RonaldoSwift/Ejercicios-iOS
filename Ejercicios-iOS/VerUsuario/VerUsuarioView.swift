//
//  VerUsuarioView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 19/12/22.
//

import SwiftUI

struct VerUsuarioView: View {
    
    let verUsuarioViewModel : VerUsuarioViewModel = VerUsuarioViewModel()
    
    @State private var usuarios : [Usuario] = []
    
    var body: some View {
        VStack{
            if #available(iOS 16.0, *) {
                HStack{
                    Text("Añadir Usuario: ")
                    
                    Spacer()
                    
                    NavigationLink {
                        RegistrarUsuarioView()
                    } label: {
                        Image("mas")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30, alignment: .leading)
                    }
                }
                
                if(usuarios.count > 0){
                    List{
                        ForEach(usuarios, id: \.id){ (usuario: Usuario) in
                            celdaDeUsuario(usuario: usuario)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Reporte de Usuarios")
                }
                else{
                    Spacer()
                    Text("No se encontraon resultados")
                    Spacer()
                }
                
            } else {
                // Fallback on earlier versions
            }
        }
        .task {
            let descriptionDeUsuario = await verUsuarioViewModel.obtenerTodosLosUsuarios()
            usuarios = descriptionDeUsuario
        }
        .padding()
        .background(Color("ColorFondoPrincipal"))
    }
    
    private  func celdaDeUsuario(usuario: Usuario) -> some View {
        return  NavigationLink {
            EditarUsuarioView(usuario: usuario)
        } label: {
            Text("id: \(usuario.id) \nNombre: \(usuario.nombre) \nApellido: \(usuario.apellido) \nDNI: \(usuario.dni) \nEdad: \(usuario.edad)")
        }
    }
}

struct VerUsuarioView_Previews: PreviewProvider {
    static var previews: some View {
        VerUsuarioView()
    }
}
