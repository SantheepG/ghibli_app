//
//  DefaultNetworkingService.swift
//  GhibliApp
//
//  Created by Pubudu Mihiranga on 2025-10-31.
//

import Foundation

// MARK: - Default Implementation of NetworkService
// Handles all API requests and JSON decoding
struct DefaultNetworkingService: NetworkService {
    
    // MARK: Generic Fetch Function
    // Fetches any Decodable type T from a given URL
    func fetch<T: Decodable>(url: String, type: T.Type) async throws -> T {
        
        // Convert string to valid URL or throw error
        guard let url = URL(string: url) else {
            throw APIError.invalidURL
        }
        
        // using guard -
        // 1. safely unwraps the URL,
        // 2. if it's invalid, exit early with a controlled error
        // 3. prevents runtime crash
        
        do {
            // Perform async network request
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // Validate HTTP status code (must be 200–299)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse
            }
            
            // Decode the JSON response into model T
            return try JSONDecoder().decode(type, from: data)
            
        // MARK: Error Handling
        // Handle decoding errors separately
        } catch let error as DecodingError {
            throw APIError.decoding(error)
        
        // Handle network-related errors (no internet, timeout, etc.)
        } catch let error as URLError {
            throw APIError.networkError(error)
        }
    }
    
    // MARK: Fetch All Films
    // Uses the generic fetch() to decode [Film]
    func fetchFilms() async throws -> [Film] {
        let url = "https://ghibliapi.vercel.app/films"
        return try await fetch(url: url, type: [Film].self)
    }
    
    // MARK: Fetch a Single Person
    // Allows fetching character details using a dynamic URL
    func fetchPerson(url: String) async throws -> Person {
        return try await fetch(url: url, type: Person.self)
    }
}
