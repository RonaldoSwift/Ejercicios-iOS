//
//  ComidaImageView.swift
//  Ejercicios-iOS
//
//  Created by Ronaldo on 25/01/23.
//

import SwiftUI

struct ComidaImageView: View {
    @EnvironmentObject var sharedMusicaViewModel: SharedComidaViewModel
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct ComidaImageView_Previews: PreviewProvider {
    static var previews: some View {
        ComidaImageView()
    }
}
