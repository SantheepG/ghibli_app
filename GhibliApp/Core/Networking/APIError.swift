//
//  APIError.swift
//  GhibliApp
//
//  Created by Santheep Ganeswaran on 2025-10-31.
//

import Foundation

// MARK: - Custom Error Type for API Calls
// Conforming to LocalizedError allows returning user-friendly descriptions
enum APIError: LocalizedError {
    
    // MARK: - Error Cases
    case invalidURL              // Thrown when URL string is malformed
    case invalidResponse         // Thrown when server returns unexpected status/code
    case decoding(Error)         // Thrown when JSON decoding fails
    case networkError(Error)     // Thrown for underlying network issues (e.g., no internet)
    
    // MARK: - Human-Readable Error Messages
    // errorDescription is used by SwiftUI alerts, print(), etc.
    var errorDescription: String? {
        switch self {
            case .invalidURL:
                return "The URL is invalid"
            case .invalidResponse:
                return "Invalid response from server"
            case .decoding(let error):
                return "Failed to decode response: \(error.localizedDescription)"
            case .networkError(let error):
               return "Network error: \(error.localizedDescription)"
        }
    }
}
