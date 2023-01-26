//
//  VerComidaView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 25/01/23.
//

import SwiftUI

struct VerComidaView: View {
    var verComidaViewModel:VerComidaViewModel = VerComidaViewModel()
    @State private var comidas: [GetComidasResponse] = []
    @State private var mostrarSiguientePantalla = false
    @EnvironmentObject var sharedComidaViewModel: SharedComidaViewModel
    
    var body: some View {
        ZStack{
            VStack{
                Image("ComidaVer")
                    .resizable()
                    .scaledToFit()
                if #available(iOS 16.0, *) {
                    if(comidas.count > 0){
                        ZStack{
                            List{
                                ForEach(comidas, id: \.id) { (getComidasResponse: GetComidasResponse) in
                                    celdaDeVerComida(
                                        
                                        comida: getComidasResponse,
                                        clickEnTexto: {
                                            
                                            //Guardamos la comida que tocamos en la lista para usarlo en la otra pantalla
                                            sharedComidaViewModel.guardarGetComidasResponse(getMusicasResponse: getComidasResponse)
                                            
                                            //Asiganmos true para navegar a la siguiente pantalla
                                            mostrarSiguientePantalla = true
                                        }, clickEnTacho: {
                                            Task{
                                                do{
                                                    let _ = try await self.verComidaViewModel.eliminarMusica(deletComidasRequest: DeleteComidasRequest.init(id: getComidasResponse.id))
                                                    //Pedimos las musicas del servidor
                                                    let comidasDelServidor = try await verComidaViewModel.obtenerTodasLasComidas()
                                                    //Remplazamos la lista local con la lista del servidor
                                                    comidas = comidasDelServidor
                                                    
                                                } catch let error{
                                                    print("ERROR")
                                                }
                                            }
                                        })
                                }
                            }
                            .scrollContentBackground(.hidden)
                        }
                    }
                    else{
                        Spacer()
                        Text("No se encontro Menu De Comidas")
                        Spacer()
                    }
                } else {
                    // Fallback on earlier versions
                }
            }.task {
                do{
                    let comidas = try await verComidaViewModel.obtenerTodasLasComidas()
                    self.comidas = comidas
                } catch{
                    fatalError("No se encontraron resultados")
                }
            }
            .padding()
            .navigationTitle("Lista de Reproduccion")
            .background(Color("FondoPrincipal"))
            
            NavigationLink(destination: ComidaImageView(),
                           isActive: $mostrarSiguientePantalla) {
                EmptyView()
            }
        }
    }
    
    private func celdaDeVerComida(
        comida:GetComidasResponse,
        clickEnTexto: @escaping ()-> Void,
        clickEnTacho: @escaping () -> Void
    ) -> some View{
        HStack{
            Text("ID:\(comida.id) \nNombre\(comida.nombre) \nPrecio\(comida.precio)")
                .onTapGesture {
                    clickEnTexto()
                }
            Button {
                clickEnTacho()
            } label: {
                Image("Tachito")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30,height: 30)
            }
        }
    }
}
struct VerComidaView_Previews: PreviewProvider {
    static var previews: some View {
        VerComidaView()
    }
}
