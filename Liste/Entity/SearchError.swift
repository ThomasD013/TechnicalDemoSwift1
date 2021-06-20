//
//  SearchError.swift
//  Liste
//
//  Created by Thomas on 26/06/2021.
//

import Foundation

public struct SearchError: Codable {
    let response: String
    let error: String

    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case error = "Error"
    }
}
