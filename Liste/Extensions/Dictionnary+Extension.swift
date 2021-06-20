//
//  Dictionnary+Extensions.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import Foundation

extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
