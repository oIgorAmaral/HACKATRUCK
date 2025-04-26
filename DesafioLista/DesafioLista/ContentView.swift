import SwiftUI

struct ContentView: View {
    let arrayMusicas = [
        Song(id: 1, name: "Somewhere I Belong", artist: "Linkin Park", capa: "https://i.scdn.co/image/ab67616d0000b2735f1f51d14e8bea89484ecd1b"),
        Song(id: 2, name: "God's Plan", artist: "Drake", capa: "https://images.genius.com/ae0cd04ff9417b23861f674772ded07f.1000x1000x1.jpg"),
        Song(id: 3, name: "Black In Black", artist: "AC'DC", capa: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuwP1duS5fEp0VBfdL_vvRP5i0y9qY3-7iBw&s"),
        Song(id: 4, name: "House of The Rising Sun", artist: "White Buffalo", capa: "https://i.pinimg.com/1200x/64/4d/15/644d15a1d1da43c6e5255509e902715a.jpg"),
        Song(id: 5, name: "Somebody To love", artist: "Queen", capa: "https://upload.wikimedia.org/wikipedia/pt/f/f5/Queen_-_Somebody_to_Love_-_1976.jpg"),
    ]

    struct Song: Identifiable {
        var id: Int
        var name: String
        var artist: String
        var capa: String
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 14) {
                    ForEach(arrayMusicas) { musica in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(musica.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(musica.artist)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            AsyncImage(url: URL(string: musica.capa)) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                }
                            }
                            .frame(width: 80, height: 80)
                            .cornerRadius(5)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Músicas")
            .navigationBarTitleDisplayMode(.large)
            .background(
                LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

#Preview {
    ContentView(Tela02)
}

