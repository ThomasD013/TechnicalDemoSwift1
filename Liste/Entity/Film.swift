//
//  Film.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import Foundation

public struct Film: Codable {
    let title, year, imdbID, type, poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}
