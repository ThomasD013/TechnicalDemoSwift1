//
//  ViewController.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class SearchViewController: UIViewController, UITableViewDelegate, Setupable {
    typealias SetupModel = SearchViewModel

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    private var disposeBag = DisposeBag()
    public var viewModel: SearchViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        tableView.register(SearchTableViewCell.self)
        tableView.rowHeight = 70
        searchBar.searchBarStyle = .minimal
        logoImageView.image = UIImage(systemName: "tv")
        titleLabel.text = "Box Office"
        tableView.separatorStyle = .none
        bindViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    func setup(with model: SearchViewModel) {
        viewModel = model
    }

    private func bindViewModel() {
        searchBar.rx.text
            .asDriver()
            .drive(onNext: { [weak self] text in
                self?.viewModel?.searchBarText.accept(text)
            })
            .disposed(by: disposeBag)

        viewModel?.cellsDataSource.bind(to: tableView.rx.items(cellIdentifier: SearchTableViewCell.reuseIdentifier, cellType: SearchTableViewCell.self)) { (row, model, cell) in
            cell.setup(with: model)
            cell.viewController = self
            cell.backgroundColor = model.getBackgroundColor(rowNumber: row)
        }
        .disposed(by: disposeBag)
    }
}

extension SearchViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.searchResponse.value?.search.count ?? 0
    }
}

