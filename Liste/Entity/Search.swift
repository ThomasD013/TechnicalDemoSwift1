//
//  SearchFilm.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import Foundation

public struct Search: Codable {
    let search: [Film]
    let totalResults: String
    let response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}
