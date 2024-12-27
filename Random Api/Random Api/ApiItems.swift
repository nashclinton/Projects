import Foundation

// Representative model
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

// SearchResponse model
struct SearchResponse: Codable {
    let results: [Representative]
}

// API error handling
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

// Fetch representatives from the API
func fetchRepresentatives(matching query: [String: String]) async throws -> [Representative] {
    var urlComponents = URLComponents(string: "https://whoismyrepresentative.com/getall_reps_byname.php")!
    
    // Append the output=json parameter
    urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
    urlComponents.queryItems?.append(URLQueryItem(name: "output", value: "json"))
    
    // Perform the network request
    let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw ApiError.invalidResponse
    }
    
    // Decode the JSON response
    let decoder = JSONDecoder()
    do {
        let searchResponse = try decoder.decode(SearchResponse.self, from: data)
        return searchResponse.results
    } catch {
        print("Raw response data: \(String(data: data, encoding: .utf8) ?? "No response data")")
        throw ApiError.decodingError
    }
}
