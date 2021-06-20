//
//  SearchTableViewCell.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import UIKit

class SearchTableViewCellModel {
    let imageUrl: String
    let title: String
    let year: String
    let imdbId: String

    init(image: String, title: String, year: String, imdbId: String) {
        self.imageUrl = image
        self.title = title
        self.year = year
        self.imdbId = imdbId
    }

    public var imageView: UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        if let url = URL(string: imageUrl) {
            imageView.load(url: url)
        }
        return imageView
    }

    public func getBackgroundColor(rowNumber: Int) -> UIColor? {
        if rowNumber % 2 == 0 {
            return UIColor(hex: "#F5F5F5FF")
        } else {
            return .white
        }
    }
}
