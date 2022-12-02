//
//  VerClientesView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo Andre Vargas Huaman on 29/11/22.
//

import Foundation
import SwiftUI

struct VerClientesView : View{
    
    let verClientesViewModel : VerClientesViewModel = VerClientesViewModel()
    
    @State private var listaString : [String] = []
    @State private var mensaje : String = "Holamundo"
    
    var body: some View{
        ScrollView{
            List{
                ForEach(listaString, id: \.self){ (stringe: String) in
                    Text(stringe)
                }
            }
        }.task {
            let nombreDeClientes = await verClientesViewModel.obtenrTodosLosClientes()
            listaString = nombreDeClientes
        }
        
    }
}

struct VerClientesView_Previews: PreviewProvider{
    
    static var previews: some View{
        VerClientesView()
    }
}
