//
//  VerUsuariosView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 6/01/23.
//

import SwiftUI

struct VerUsuariosView: View {
    var verUsuarioViewModel : VerUsuarioViewModel = VerUsuarioViewModel()
    @State private var usuarios : [GetUsuariosResponse] = []
    var body: some View {
        VStack{
            if #available(iOS 16.0, *) {
                
                if(usuarios.count > 0){
                    List{
                        ForEach(usuarios, id: \.id){ (usuario : GetUsuariosResponse) in
                            Text("\(usuario.nombre) - \(usuario.apellido)" )
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Reporte De Usuarios")
                }
                else{
                    Spacer()
                    Text("No se encontraron resultados")
                    Spacer()
                }
            } else {
                // Fallback on earlier versions
            }
        }
        .task{
            do{
                let usuarios = try await verUsuarioViewModel.obtenerTodosLosUsuarios()
                self.usuarios = usuarios
            } catch{
                fatalError("No se puedo encontrar")
            }
        }
        .padding()
        .background(Color("ColorFondoPrincipal"))
        .navigationTitle("REGISTRO DE PACIENTE")
    }
}

struct VerUsuariosView_Previews: PreviewProvider {
    static var previews: some View {
        VerUsuariosView()
    }
}
