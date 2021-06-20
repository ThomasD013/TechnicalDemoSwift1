//
//  FilmSheetViewController.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import UIKit
import RxSwift
import Cosmos

class FilmSheetViewController: UIViewController, Setupable {
    typealias SetupModel = FilmSheetViewModel
    var viewModel: FilmSheetViewModel?

    @IBOutlet private weak var titleLabel: PaddingLabel!
    @IBOutlet private weak var filmImageView: UIImageView!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var releaseDateTextLabel: UILabel!

    @IBOutlet weak var imdbRateView: CosmosView!
    @IBOutlet private weak var metascoreRateView: CosmosView!
    @IBOutlet private weak var synopsisLabel: UILabel!
    @IBOutlet private weak var synopsisTextLabel: UILabel!

    @IBOutlet private weak var castingLabel: UILabel!
    @IBOutlet private weak var castingTextLabel: UILabel!

    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        setupRatesView(view: self.imdbRateView, text: "film_sheet_imdb_rate".localized)
        setupRatesView(view: self.metascoreRateView, text: "film_sheet_metascore".localized)

        bindViewModel()
    }

    private func setupLabels() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        titleLabel.layer.borderWidth = 1
        titleLabel.layer.cornerRadius = 5.0
        titleLabel.layer.borderColor = UIColor.gray.cgColor
        titleLabel.layer.backgroundColor = UIColor(hex: "#F5F5F5FF")?.cgColor
        titleLabel.padding(20, 20, 20, 20)
        titleLabel.numberOfLines = 0

        synopsisLabel.font = UIFont.boldSystemFont(ofSize: 20)
        synopsisTextLabel.numberOfLines = 0

        castingLabel.font = UIFont.boldSystemFont(ofSize: 20)
        castingTextLabel.numberOfLines = 0
    }

    private func setupRatesView(view: CosmosView, text: String) {
        view.text = text
        view.settings.totalStars = 5
        view.settings.starSize = 30
        view.settings.filledColor = .systemYellow
        view.settings.emptyColor = .clear
        view.settings.emptyBorderColor = .black
        view.settings.emptyBorderWidth = 5
        view.settings.updateOnTouch = false
    }

    func setup(with model: FilmSheetViewModel) {
        viewModel = model
    }

    private func bindViewModel() {
        viewModel?.completeFilm
            .asDriver()
            .compactMap { $0 }
            .drive(onNext: { [weak self] film in
                guard let self = self else { return }
                self.titleLabel.text = film.title
                self.filmImageView.image = UIImage(systemName: "photo")
                if let url = URL(string: film.poster) {
                    self.filmImageView.load(url: url)
                }

                self.releaseDateLabel.text = "film_sheet_release_date".localized
                self.releaseDateTextLabel.text = film.released
                if let imdbRating = Double(film.imdbRating) {
                    self.imdbRateView.rating = imdbRating/2
                }

                if let metacriticRate = Double(film.metascore) {
                    self.metascoreRateView.rating = metacriticRate/20
                }

                self.synopsisLabel.text = "film_sheet_synopsis".localized
                self.synopsisTextLabel.text = film.plot
                self.castingLabel.text = "film_sheet_casting".localized
                self.castingTextLabel.text = film.actors
        })
        .disposed(by: disposeBag)
    }

}
