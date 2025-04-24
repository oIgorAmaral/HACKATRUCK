import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color.gray.opacity(0.7)
                .ignoresSafeArea()
            
            VStack {
                Text("Desafio")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                
                Button("Modo 1") {
                    
                }
                .frame(maxWidth: 200, maxHeight: 70)
                .background(Color.pink)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding()
                
                Button("Modo 2") {
                    
                }
                .frame(maxWidth: 200, maxHeight: 70)
                .background(Color.pink)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding()
                
                Button("Modo 3") {
                   
                }
                .frame(maxWidth: 200, maxHeight: 70)
                .background(Color.pink)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

