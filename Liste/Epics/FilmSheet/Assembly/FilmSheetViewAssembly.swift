//
//  FilmSheetAssembly.swift
//  Liste
//
//  Created by Thomas on 26/06/2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

final class FilmSheetViewAssembly: BaseAssembly {
    override var assemblies: [Assembly] {
        return [FilmSheetServiceAssembly()]
    }

    override func registerControllers(in container: Container) {
        registerFilmSheetViewController(container: container)
    }

    private func registerFilmSheetViewController(container: Container) {
        assemblies.forEach { $0.assemble(container: container) }

        container.register(FilmSheetInputs.self) { r in
            return FilmSheetInputs(filmSheet: r.resolve(FilmSheetServicing.self)!)
        }

        container.autoregister(FilmSheetViewModel.self, initializer: FilmSheetViewModel.init)

        container.register(FilmSheetViewController.self) { r in
            let viewController = FilmSheetViewController()
            viewController.viewModel = r.resolve(FilmSheetViewModel.self)
            return viewController
        }
    }
}
