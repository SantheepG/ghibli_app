//
//  Person.swift
//  GhibliApp
//
//  Created by Pubudu Mihiranga on 2025-10-31.
//

import Foundation

// Model representing a Person fetched from the API
struct Person: Identifiable, Decodable, Equatable {
    
    // MARK: - Properties (match JSON fields)
    let id: String            // Unique identifier (required for Identifiable)
    let name: String          // Person's name
    let gender: String        // Gender string from API
    let age: String           // Age (often comes as a string in the Ghibli API)
    let eyeColor: String      // JSON key: "eye_color"
    let hairColor: String     // JSON key: "hair_color"
    let films: [String]       // List of film URLs the character appears in
    let species: String       // URL for species info
    let url: String           // Direct resource URL
    
    // MARK: - JSON Mapping
    // Maps JSON snake_case keys to Swift camelCase properties
    enum CodingKeys: String, CodingKey {
        case id, name, gender, age, films, species, url
        case eyeColor = "eye_color"     // snake_case → camelCase
        case hairColor = "hair_color"
    }
}

