//
//  ContentView.swift
//  Desafio04
//
//  Created by Turma02-10 on 05/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var velocidade: Double = 0.00
    @State private var distancia: Double = 0
    @State private var tempo: Double = 0
    
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack {
                
                VStack {
                    VStack(spacing: 15) {
                        HStack {
                            Text("Digite a distancia (km)")
                                .foregroundColor(.white)
                         TextField("Digite a Distancia(km) :")
                            TextFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .frame(width: 100)
                                
                        }
                    }
                }
            }
            
            
            
            
            VStack {
                
                Text(String(format: "%.2f km/h", velocidade))
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding(.bottom, 20)
                
                
                Image("interrogacao")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.yellow, lineWidth: 5))
                    .padding(.bottom, 40)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Tartaruga - 0.3 km/h")
                    Text("Elefante - 40 km/h")
                    Text("Avestruz - 70 km/h")
                    Text("Leão - 80 km/h")
                    Text("Guepardo - 100 km/h")
                }
                .padding()
                .background(Color.black.opacity(0.3))
                .cornerRadius(10)
                .foregroundColor(.white)
            }
            
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 5) {
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
