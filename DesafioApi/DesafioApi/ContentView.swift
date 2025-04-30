import SwiftUI

struct ContentView: View {
    
    @StateObject var viewmodel = ViewModel()
    @State private var corfundo: Color = .black
    
    var body: some View {
        NavigationView {
            ZStack {
               
                corfundo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 50) {
                        
                        Text("Atores de HARRY POTTER")
                            .foregroundStyle(.white)
                            .font(.system(size: 20))
                            .bold()
                        
                        
                        ForEach(viewmodel.personagens) { persona in
                            HStack(alignment: .center, spacing: 16) {
                                AsyncImage(url: URL(string: Disney.imageUrl)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 130)
                                            .clipped()
                                            .cornerRadius(8)

                                    }
                                }
                                VStack(alignment: .center){
                                    Text(persona.name)
                                        .foregroundStyle(.white)
                                        .bold()
                                        .font(.system(size: 20))
                                    Text(persona.actor)
                                        .foregroundStyle(.gray)
                                        .bold()
                                        .font(.system(size: 15))
                                    
                                }
                                Spacer()
                            }
                        }
                    }
                    .padding(40)
                }
            }
        }
        .onAppear {
            viewmodel.fetch()
        }
    }
}


#Preview {
    ContentView()
}
