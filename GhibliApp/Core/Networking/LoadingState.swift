///Users/santheepg/Desktop/MNAD/iit-mnad-2025/GhibliApp/GhibliApp/Core/Networking/LoadingState.swift
//  LoadingState.swift
//  GhibliApp
//
//  Created by Santheep Ganeswaran on 2025-10-31.
//

import Foundation

// MARK: - Generic Loading State Enum
// Represents different UI states when fetching data
enum LoadingState<T: Equatable>: Equatable {
    
    // MARK: - States
    case idle                 // No action has started yet
    case loading              // Currently fetching data
    case loaded(T)            // Successfully fetched data of type T
    case error(String)        // Failed with an error message
    
    // MARK: - Helper: Check if state is loading
    var isLoading: Bool {
        if case .loading = self {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Helper: Extract loaded data
    // Returns T only if current state is .loaded
    var data: T? {
        if case .loaded(let value) = self {
            return value
        } else {
            return nil
        }
    }
    
    // MARK: - Helper: Extract error message
    // Returns String only if current state is .error
    var error: String? {
        if case .error(let message) = self {
            return message
        } else {
            return nil
        }
    }
}
