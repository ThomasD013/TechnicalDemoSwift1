//
//  ViewControllerProvider+SearchFilm.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import Foundation
import UIKit
import Swinject

extension ViewControllerProvider {
    struct Film {
        private init() {}

        static var search: SearchViewController {
            let resolver = Assembler([SearchFilmViewAssembly()]).resolver
            let viewController = resolver.resolve(SearchViewController.self).orFatalError()
            return viewController
        }

        static func sheet(imdbID: String) -> FilmSheetViewController {
            let resolver = Assembler([FilmSheetViewAssembly()]).resolver

            let viewController = resolver.resolve(FilmSheetViewController.self).orFatalError()
            viewController.viewModel?.setup(imdbID: imdbID)

            return viewController
        }
    }
}
