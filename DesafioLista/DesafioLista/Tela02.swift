//
//  tela02.swift
//  DesafioLista
//
//  Created by Turma02-10 on 08/04/25.
//

import SwiftUI

struct Tela02: View {
    var musica: ContentView.Song
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: musica.capa))
        }
    }
}

#Preview {
    Tela02()
}
