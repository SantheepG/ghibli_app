//
//  Film.swift
//  GhibliApp
//
//  Created by Pubudu Mihiranga on 2025-10-31.
//

import Foundation

// Model representing a Film object
struct Film: Identifiable, Decodable, Equatable, Hashable {
    // MARK: - Properties (must match JSON data)
    let id: String                 // Unique ID (required for Identifiable)
    let title: String              // Film title
    let description: String        // Summary of the film
    let director: String           // Director name
    let producer: String           // Producer name
    let releaseYear: String        // JSON key: "release_date"
    let score: String              // JSON key: "rt_score"
    let duration: String           // JSON key: "running_time"
    let image: String              // Poster image URL
    let bannerImage: String        // JSON key: "movie_banner"
    let people: [String]           // Characters appearing in the film
    
    // MARK: - JSON Mapping
    // CodingKeys is used when JSON keys differ from Swift property names
    enum CodingKeys: String, CodingKey {
        case id, title, image, description, director, producer, people
        case bannerImage = "movie_banner"   // maps JSON snake_case → camelCase
        case releaseYear = "release_date"
        case duration = "running_time"
        case score = "rt_score"
    }
}

