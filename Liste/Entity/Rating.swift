//
//  Rating.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import Foundation

public struct Rating: Codable {
    let source, value: String

    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}
