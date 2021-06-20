//
//  UITableView+Extension.swift
//  Liste
//
//  Created by Thomas on 26/06/2021.
//

import UIKit

extension UITableView {
    func register(_ cellType: UITableViewCell.Type) {
        self.register(UINib(nibName: cellType.reuseIdentifier, bundle: nil), forCellReuseIdentifier: cellType.reuseIdentifier)
    }
}
