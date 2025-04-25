import SwiftUI

struct ContentView: View {
    @State private var name: String = "THEBOYS"
    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [.red, .black, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
               
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Para IGOR")
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    
                    ZStack {
                    
                    Image("theboys")
                        .resizable()
                        .scaledToFit()
                        .overlay(
                            VStack{
                                Spacer()
                                NavigationLink(destination: Tela2()) {
                                    HStack {
                                        Image(systemName: "play.fill")
                                        Text("Assistir")
                                            .fontWeight(.bold)
                                    }
                                    .frame(maxWidth: 121)
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                                }
                            }
                        )
                    }

                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}

