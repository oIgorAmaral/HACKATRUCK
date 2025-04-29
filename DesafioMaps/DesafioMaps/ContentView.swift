//
//  ContentView.swift
//  DesafioMaps
//
//  Created by Turma02-10 on 28/04/25.
//

import SwiftUI
import MapKit

struct Location: Identifiable, Hashable {
    let id = UUID()
    let nome: String
    let foto: String
    let descricao: String
    let latitude: Double
    let longitude: Double
}

struct ContentView: View {
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
            span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)
        )
    )
    
    @State private var selectedLocation = Location(
        nome: "Cristo Redentor",
        foto: "https://www.luxuryrentals.com.br/image/d235/5ca7c30458b055001007d872/?ver=3b9b&width=744",
        descricao: "Cristo Redentor é uma famosa estátua de Jesus Cristo localizada no topo do Morro do Corcovado, no Rio de Janeiro, Brasil.",
        latitude: -22.9519,
        longitude: -43.2105
    )
    
    @State private var showSheet = false  // Novo: controlar a exibição do Sheet
    
    let locations = [
        Location(
            nome: "Cristo Redentor",
            foto: "https://www.luxuryrentals.com.br/image/d235/5ca7c30458b055001007d872/?ver=3b9b&width=744",
            descricao: "Cristo Redentor é uma famosa estátua de Jesus Cristo localizada no topo do Morro do Corcovado, no Rio de Janeiro, Brasil.",
            latitude: -22.9519,
            longitude: -43.2105
        ),
        Location(
            nome: "Taj Mahal",
            foto: "https://upload.wikimedia.org/wikipedia/commons/d/da/Taj-Mahal.jpg",
            descricao: "O Taj Mahal é um mausoléu de mármore branco situado em Agra, na Índia.",
            latitude: 27.1751,
            longitude: 78.0421
        ),
        Location(
            nome: "Torre Eiffel",
            foto: "https://upload.wikimedia.org/wikipedia/commons/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg",
            descricao: "A Torre Eiffel é um dos monumentos mais reconhecidos do mundo, localizada em Paris, França.",
            latitude: 48.8584,
            longitude: 2.2945
        ),
        Location(
            nome: "Grande Muralha da China",
            foto: "https://upload.wikimedia.org/wikipedia/commons/6/6f/GreatWall_2004_Summer_4.jpg",
            descricao: "A Grande Muralha da China é uma série de fortificações que se estendem por milhares de quilômetros no norte da China.",
            latitude: 40.4319,
            longitude: 116.5704
        ),
    ]
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                ForEach(locations) { location in
                    Annotation(
                        location.nome,
                        coordinate: CLLocationCoordinate2D(
                            latitude: location.latitude,
                            longitude: location.longitude
                        )
                    ) {
                        VStack {
                            Image(systemName: "hand.point.up.left.fill")
                                .font(.title)
                                .foregroundColor(.red)
                                .onTapGesture {
                                    selectedLocation = location
                                    showSheet.toggle()
                                }
                            Text(location.nome)
                                .font(.callout)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(5)
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .sheet(isPresented: $showSheet) {
                LocationDetailView(location: selectedLocation)
            }
            
            VStack {
                Picker("Selecione o local", selection: $selectedLocation) {
                    ForEach(locations, id: \.self) { location in
                        Text(location.nome)
                    }
                }
                .onChange(of: selectedLocation) { newLocation in
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: newLocation.latitude, longitude: newLocation.longitude),
                            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
                        )
                    )
                }
                .pickerStyle(.menu)
                .background(Color.yellow)
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding()
                
                Spacer()
            }
        }
    }
}

// Nova View para o detalhe
struct LocationDetailView: View {
    let location: Location
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: location.foto)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 300)
            .cornerRadius(15)
            .padding()
            
            Text(location.nome)
                .font(.largeTitle)
                .bold()
                .padding(.top)
            
            Text(location.descricao)
                .font(.body)
                .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

