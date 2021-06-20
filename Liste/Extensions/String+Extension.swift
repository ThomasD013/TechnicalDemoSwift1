//
//  String+Extension.swift
//  Liste
//
//  Created by Thomas on 26/06/2021.
//

import Foundation

public extension String {
    var localized: String { return NSLocalizedString(self, comment: "") }
}
