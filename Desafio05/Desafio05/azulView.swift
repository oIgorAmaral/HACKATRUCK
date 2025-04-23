//
//  azulView.swift
//  Desafio05
//
//  Created by Turma02-10 on 06/04/25.
//

import SwiftUI

struct azulView: View {
    var body: some View {
        ZStack {
            Color(.blue)
                .edgesIgnoringSafeArea(.top)
                Circle()
                .frame(width: 320)
            Image(systemName: "desktopcomputer")
                .font(.system(size: 180))
                .foregroundColor(.blue)
            
        }
    }
}
#Preview {
    azulView()
}
