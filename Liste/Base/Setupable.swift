//
//  Setupable.swift
//  Liste
//
//  Created by Thomas on 26/06/2021.
//

import Foundation

public protocol Setupable {
    associatedtype SetupModel

    func setup(with model: SetupModel)
}
