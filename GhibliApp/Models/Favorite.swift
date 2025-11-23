//
//  Favorite.swift
//  GhibliApp
//
//  Created by Pubudu Mihiranga on 2025-10-31.
//

import SwiftData

// MARK: - SwiftData Model
// @Model turns this class into a persistable database entity
@Model
final class Favorite {
    
    // MARK: - Properties
    // .unique ensures each filmID can appear only once in the database
    @Attribute(.unique) var filmID: String

    // MARK: - Initializer
    // Required to create a new Favorite entry
    init(filmID: String) {
        self.filmID = filmID
    }
}