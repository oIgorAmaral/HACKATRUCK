//
//  ContentView.swift
//  Desafio10
//
//  Created by Turma02-28 on 29/04/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.red,.red, .black]), startPoint: .top, endPoint: .bottom)

                VStack{
                    AsyncImage(url: "https://sociedadegeek.com.br/wp-content/uploads/2024/04/71b58b2bfd80f1666c1a69c43890397c52780475_hq.jpg")
                        .resizable()
                        .frame(width: 400,height: 300)
                        .shadow(radius: 20)
                    
                    ScrollView{
                        ForEach(viewModel.personagens){ p in
                            NavigationLink(destination: CharacterView(character: p)){
                                HStack{
                                    if let imageUrl = p.image, let url = URL(string: imageUrl){
                                        AsyncImage(url: url) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 70, height: 70)
                                        } placeholder: {
                                            ProgressView()
                                                .progressViewStyle(CircularProgressViewStyle())
                                                .frame(width: 70, height: 70)
                                        }
                                    }
                                    VStack {
                                        Text(p.name ?? "Nome Desconhecido")
                                            .font(.headline)
                                            .frame(height: 70)
                                    }
                                    .frame(width: 250)
                                }
                            }
                            
                        }
                    }
                }
                .onAppear {
                    viewModel.fetch()
                }
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
