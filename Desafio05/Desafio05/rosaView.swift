//
//  rosaView.swift
//  Desafio05
//
//  Created by Turma02-10 on 06/04/25.
//

import SwiftUI

struct rosaView: View {
    var body: some View {
        ZStack {
            Color(.pink)
                .edgesIgnoringSafeArea(.top)
                Circle()
                .frame(width: 320)
            Image(systemName: "paintbrush")
                .font(.system(size: 180))
                .foregroundColor(.pink)
            
        }
    }
}

#Preview {
    rosaView()
}
