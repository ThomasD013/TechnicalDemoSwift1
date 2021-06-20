//
//  SearchViewModel.swift
//  Liste
//
//  Created by Thomas on 25/06/2021.
//

import Foundation
import RxRelay
import RxSwift

class SearchViewModel:ViewModel<SearchFilmInputs> {
    public var searchBarText = BehaviorRelay<String?>(value: nil)
    public var searchResponse = BehaviorRelay<Search?>(value: nil)
    public var cellsDataSource = BehaviorRelay<[SearchTableViewCellModel]>(value: [])

    public func setup() {
        searchBarText
            .asDriver()
            .compactMap { $0 }
            .drive(onNext: { [weak self] text in
                self?.inputs.searchFilm.call(with: SearchFilmServiceParameters(search: text))
                    .subscribe({ [weak self] event in
                        self?.handleEvent(event, completion: { [weak self] response in
                            guard let response = response else { return }
                            self?.searchResponse.accept(response)
                        })
                    })
            })
            .disposed(by: disposeBag)

        searchResponse
            .asDriver()
            .drive(onNext: { [weak self] response in
                let cells: [SearchTableViewCellModel] = response?.search.map({ film in
                    return SearchTableViewCellModel(
                        image: film.poster,
                        title: film.title,
                        year: film.year,
                        imdbId: film.imdbID)
                }) ?? []
                self?.cellsDataSource.accept(cells)
            })
            .disposed(by: disposeBag)
    }
}
