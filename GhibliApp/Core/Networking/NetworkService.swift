//
//  NetworkService.swift
//  GhibliApp
//
//  Created by Pubudu Mihiranga on 2025-10-31.
//

import Foundation

// MARK: - Network Service Protocol
// Defines the required functions for any networking layer
// Sendable ensures the protocol can be used safely across Swift concurrency (actors, tasks)
protocol NetworkService: Sendable {
    
    // Fetch list of all films
    func fetchFilms() async throws -> [Film]
    
    // Fetch details for a single person using a dynamic URL
    func fetchPerson(url: String) async throws -> Person
    
    // Optional future feature: search for films by keyword
    // func searchFilm(for searchTerm: String) async throws -> [Film]
}
