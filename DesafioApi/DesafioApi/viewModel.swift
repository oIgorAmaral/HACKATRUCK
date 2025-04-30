import Foundation

class ViewModel: ObservableObject {
    @Published var personagens: [Disney] = []

    func fetch() {
        guard let url = URL(string: "https://disneyapi.dev/characters") else {
            print("URL inválida")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print(error)
                return
            }

            do {
                let parsed = try JSONDecoder().decode([Disney].self, from: data)
                DispatchQueue.main.async {
                    self?.personagens = parsed
                }
            } catch {
                print("Erro ao decodificar: \(error)")
            }
        }

        task.resume()
    }
}

