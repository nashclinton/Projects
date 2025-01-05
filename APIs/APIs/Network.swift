import Foundation
import UIKit

enum NetworkError: LocalizedError {
    case imageDataMissing
    case invalidURL
    
    var errorDescription: String? {
        switch self {
        case .imageDataMissing:
            return "Image data is missing or could not be loaded."
        case .invalidURL:
            return "Invalid URL for image fetch."
        }
    }
}

struct DogPhotoResponse: Codable {
    let message: String
    let status: String
}

struct Network {
    
    static func fetchDogPhoto() async throws -> UIImage {
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        let photoResponse = try JSONDecoder().decode(DogPhotoResponse.self, from: data)

        guard photoResponse.status == "success", let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.imageDataMissing
        }
        
        return try await fetchImage(from: URL(string: photoResponse.message)!)
    }

    static func fetchImage(from url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
              let image = UIImage(data: data) else {
            throw NetworkError.imageDataMissing
        }
        
        return image
    }
}


struct Representative: Codable {
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let website: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case party = "party"
        case state = "state"
        case district = "district"
        case phone = "phone"
        case office = "office"
        case website = "link"
    }
}


struct SearchResponse: Codable {
    let results: [Representative]
}

enum ApiError: Error, LocalizedError {
    case itemsNotFound
    case invalidResponse
    case decodingError
    
    var errorDescription: String? {
        switch self {
        case .itemsNotFound:
            return "No representatives found matching the search criteria."
        case .invalidResponse:
            return "Received an invalid response from the server."
        case .decodingError:
            return "Failed to decode the response from the server."
        }
    }
}

func fetchRepresentatives(matching query: [String: String]) async throws -> [Representative] {
    var urlComponents = URLComponents(string: "https://whoismyrepresentative.com/getall_reps_byname.php")!
    
    // Add query parameters to URL
    var queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
    queryItems.append(URLQueryItem(name: "output", value: "json"))
    urlComponents.queryItems = queryItems
    
    guard let url = urlComponents.url else {
        throw ApiError.invalidResponse
    }

    // Fetch data from the URL
    let (data, response) = try await URLSession.shared.data(from: url)
    
    // Check response status
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw ApiError.invalidResponse
    }
    
    let decoder = JSONDecoder()
    do {
        let searchResponse = try decoder.decode(SearchResponse.self, from: data)
        return searchResponse.results
    } catch {
        print("Raw response data: \(String(data: data, encoding: .utf8) ?? "No response data")")
        throw ApiError.decodingError
    }
}
