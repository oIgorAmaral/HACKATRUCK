//
//  ContentView.swift
//  Desafio05
//
//  Created by Turma02-10 on 06/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            rosaView()
                .tabItem {
                    Label("Pincel", systemImage: "paintbrush")
                }
            azulView()
                .tabItem {
                    Label("computer", systemImage: "desktopcomputer")
                }
            cinzaView()
                .tabItem {
                    Label("command", systemImage: (""))
                }
            
        }
    }
}

#Preview {
    ContentView()
}
