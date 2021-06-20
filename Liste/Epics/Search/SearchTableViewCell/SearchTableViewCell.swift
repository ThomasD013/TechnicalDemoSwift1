//
//  SearchTableViewCell.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import UIKit

class SearchTableViewCell: UITableViewCell, Setupable {
    typealias SetupModel = SearchTableViewCellModel

    private var viewModel: SearchTableViewCellModel?
    public weak var viewController : SearchViewController?
    @IBOutlet private weak var customImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        contentView.addGestureRecognizer(tap)
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        guard let viewModel = viewModel else { return }
        let controller = ViewControllerProvider.Film.sheet(imdbID: viewModel.imdbId)
        viewController?.navigationController?.pushViewController(controller, animated: false)
    }

    func setup(with model: SearchTableViewCellModel) {
        viewModel = model
        titleLabel.text = model.title
        yearLabel.text = model.year
        customImageView.image = UIImage(systemName: "photo")
        if let url = URL(string: model.imageUrl) {
            customImageView.load(url: url)
        }
    }
}
