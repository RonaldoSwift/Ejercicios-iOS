//
//  VerMusicasView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 16/01/23.
//

import SwiftUI

struct VerMusicasView: View {
    
    var verMusicasViewModel: VerMusicasViewModel = VerMusicasViewModel()
    @EnvironmentObject var sharedMusicaViewModel : SharedMusicaViewModel
    
    @State private var musicas: [GetMusicasResponse] = []
    @State private var mostrarSiguientePantalla = false
    
    var body: some View {
        ZStack{
            VStack{
                if #available(iOS 16.0, *) {
                    if(musicas.count > 0){
                        ZStack{
                            List{
                                ForEach(musicas, id: \.id) { (getMusicasResponse: GetMusicasResponse) in
                                    celdaDeVerMusicas(
                                        
                                        musica: getMusicasResponse,
                                        clickEnTexto: {
                                            
                                            //Guardamos la musica que tocamos en la lista para usarlo en la otra pantalla
                                            sharedMusicaViewModel.guardarGetMusicasResponse(getMusicasResponse: getMusicasResponse)
                                            
                                            //Asiganmos true para navegar a la siguiente pantalla
                                            mostrarSiguientePantalla = true
                                        }, clickEnTacho: {
                                            Task{
                                                do{
                                                    let _ = try await self.verMusicasViewModel.eliminarMusica(deletMusicasRequest: DeleteMusicasRequest.init(id: getMusicasResponse.id))
                                                    //Pedimos las musicas del servidor
                                                    var musicasDelServidor = try await verMusicasViewModel.obtenerTodasLasMusicas()
                                                    //Remplazamos la lista local con la lista del servidor
                                                    musicas = musicasDelServidor
                                                    
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
                        Text("No se encontro resultados de musicas")
                        Spacer()
                    }
                } else {
                    // Fallback on earlier versions
                }
            }.task {
                do{
                    let musicas = try await verMusicasViewModel.obtenerTodasLasMusicas()
                    self.musicas = musicas
                } catch{
                    fatalError("No se encontraron resultados")
                }
            }
            .padding()
            .navigationTitle("Lista de Reproduccion")
            .background(Color("FondoPrincipal"))
            
            
            NavigationLink(destination: ReproducirMusicaView(),
                           isActive: $mostrarSiguientePantalla) {
                EmptyView()
            }
        }
    }
    
    /**
     Esta funcion representa la celda de la lista
     - parameter musica: necesario para pintar el texto de la celda.
     - parameter clickEnTexto: funcion que se ejecutara cuando se toca el texto
     - parameter clickEnTacho: funcion que se ejecutara cuando se toca el tacho
     - returns: Devuelve una vista que viene hacer el HStack
     
     */
    
    private func celdaDeVerMusicas(
        musica:GetMusicasResponse,
        clickEnTexto: @escaping ()-> Void,
        clickEnTacho: @escaping () -> Void
    ) -> some View{
        HStack{
            Text("ID:\(musica.id) \n\(musica.titulo) \n\(musica.url)")
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

struct VerMusicasView_Previews: PreviewProvider {
    static var previews: some View {
        VerMusicasView()
    }
}
