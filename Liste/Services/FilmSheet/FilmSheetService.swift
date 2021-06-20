//
//  FilmSheetService.swift
//  Liste
//
//  Created by Thomas on 26/06/2021.
//

import Foundation

public struct FilmSheetServiceParameters {
    public let imdbID: String

    public init(imdbID: String) {
        self.imdbID = imdbID
    }
}

extension FilmSheetServiceParameters: Routing {
    public var queryStringParameters: [String : Any]? {
        return ["i": imdbID,
                "type": "movie"
        ]
    }
}
