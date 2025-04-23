//
//  cinzaView.swift
//  Desafio05
//
//  Created by Turma02-10 on 06/04/25.
//

import SwiftUI

struct cinzaView: View {
    var body: some View {
        ZStack {
            Color(.yellow)
                .edgesIgnoringSafeArea(.top)
                Circle()
                .frame(width: 320)
            Image(systemName: "text.and.command.macwindow")
                .font(.system(size: 180))
                .foregroundColor(.yellow)
            
        }
    }
}
#Preview {
    cinzaView()
}
