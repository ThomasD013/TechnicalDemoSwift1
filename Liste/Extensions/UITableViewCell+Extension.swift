//
//  UITableViewCell.swift
//  Liste
//
//  Created by Thomas on 26/06/2021.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
