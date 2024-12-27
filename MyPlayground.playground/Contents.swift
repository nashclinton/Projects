import Foundation

struct StoreItem: Codable {
    let term: String
    let movie: String
    let moiveArtist: String
    let media: String
}

var url = URL(string: "https://itunes.apple.com/search?media=movie")!

Task {
    let (data, response) = try await URLSession.shared.data(from: url)
    
    if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
        let response = String(decoding: data, as: Unicode.UTF8.self)
        print(response)
    }
    
}
