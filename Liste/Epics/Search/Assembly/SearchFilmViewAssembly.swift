//
//  SearchViewAssembly.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

final class SearchFilmViewAssembly: BaseAssembly {
    override var assemblies: [Assembly] {
        return [SearchFilmServiceAssembly()]
    }

    override func registerControllers(in container: Container) {
        registerSearchViewController(container: container)
    }

    private func registerSearchViewController(container: Container) {
        assemblies.forEach { $0.assemble(container: container) }

        container.register(SearchFilmInputs.self) { r in
            return SearchFilmInputs(searchFilm: r.resolve(SearchFilmServicing.self)!)
        }

        container.autoregister(SearchViewModel.self, initializer: SearchViewModel.init)
        container.register(SearchViewController.self) { r in
            let viewController = SearchViewController()
            viewController.viewModel = r.resolve(SearchViewModel.self)
            viewController.viewModel?.setup()
            return viewController
        }
    }
}
