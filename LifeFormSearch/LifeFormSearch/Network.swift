//
//  Network.swift
//  LifeFormSearch
//
//  Created by Nash Clinton on 1/4/25.
//

import Foundation

struct Item: Codable {
    let name: String
    let scientificName: String
    let id: Int

    
    enum CodingKeys: String, CodingKey {
        case name = "content"
        case scientificName = "title"
        case id = "id"

    }

}

struct SearchResponse: Codable {
    let results: [Item]
}

enum StoreItemError: Error, LocalizedError {
    case itemsNotFound
    
    var errorDescription: String? {
        switch self {
        case .itemsNotFound:
            return "No items found matching the search criteria."
        }
    }
}
func fetchItems(matching query: [String: String]) async throws -> [Item] {
    var urlComponents = URLComponents(string: "https://eol.org/api/search/1.0.json")!
    urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
    
    let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
    
    guard let httpResponse = response as? HTTPURLResponse else {
        throw URLError(.badServerResponse)
    }
    
    guard httpResponse.statusCode == 200 else {
        throw StoreItemError.itemsNotFound
    }
    
    let decoder = JSONDecoder()
    do {
        let searchResponse = try decoder.decode(SearchResponse.self, from: data)
        return searchResponse.results
    } catch {
        throw error
    }
}



struct ImageString: Codable {
    let mediaURL: String
    
}

struct TaxonConcept: Codable {
    let dataObjects: [ImageString]
}

struct ItemSearchResult: Codable {
    let taxonConcept: TaxonConcept
}



func getItem(id: Int) async throws -> URL {
    let urlComponents = URLComponents(string: "https://eol.org/api/pages/1.0/\(id).json?taxonomy=true&images_per_page=1&language=en")!
    
    let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
    
    guard let httpResponse = response as? HTTPURLResponse else {
        throw URLError(.badServerResponse)
    }
    
    guard httpResponse.statusCode == 200 else {
        throw StoreItemError.itemsNotFound
    }
    
    let decoder = JSONDecoder()
    do {
        let searchResponse = try decoder.decode(ItemSearchResult.self, from: data)
        return URL(string: searchResponse.taxonConcept.dataObjects.first!.mediaURL)!
    } catch {
        throw error
    }
}
