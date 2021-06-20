//
//  SearchFilm.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import Foundation

public struct SearchFilmServiceParameters {
    public let search: String

    public init(search: String) {
        self.search = search
    }
}

extension SearchFilmServiceParameters: Routing {
    public var queryStringParameters: [String : Any]? {
        return ["s": search,
                "type": "movie"
        ]
    }
}
