//
//  FilmSheetViewModel.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import Foundation
import RxRelay

class FilmSheetViewModel:ViewModel<FilmSheetInputs> {
    private var imdbID: String?
    public var completeFilm = BehaviorRelay<CompleteFilm?>(value: nil)

    func setup(imdbID: String) {
        self.imdbID = imdbID
        inputs.filmSheet.call(with: FilmSheetServiceParameters(imdbID: imdbID))
            .subscribe({ [weak self] event in
                self?.handleEvent(event, completion: { [weak self] response in
                    self?.completeFilm.accept(response)
                })
        })
        .disposed(by: disposeBag)
    }
}
