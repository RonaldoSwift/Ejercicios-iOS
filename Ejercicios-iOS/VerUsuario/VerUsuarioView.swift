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
        if #available(iOS 16.0, *) {
            List{
                ForEach(usuarios, id: \.id){ (usuario: Usuario) in
                    Section{
                        Text("Nombre: \(usuario.nombre) \nApellido: \(usuario.apellido) \nDNI: \(usuario.dni) \nEdad: \(usuario.edad)")
                            .foregroundColor(Color.black)
                            .background(Color.white)
                    }
                }
            }
            .task {
                let descriptionDeUsuario = await verUsuarioViewModel.obtenerTodosLosUsuarios()
                usuarios = descriptionDeUsuario
            }
            .background(Color("ColorFondoPrincipal"))
            .scrollContentBackground(.hidden)
            .navigationTitle("Reporte de Usuarios")
        } else {
            // Fallback on earlier versions
        }
    }
}

struct VerUsuarioView_Previews: PreviewProvider {
    static var previews: some View {
        VerUsuarioView()
    }
}
