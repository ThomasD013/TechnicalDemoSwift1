//
//  FilmSheetServiceAssembly.swift
//  Liste
//
//  Created by Thomas on 27/06/2021.
//

import Swinject
import RxSwift

public protocol FilmSheetServicing {
    func call(with parameters: FilmSheetServiceParameters) -> Observable<CompleteFilm?>
}

final class FilmSheetWeb: FilmSheetServicing {
    func call(with param: FilmSheetServiceParameters) -> Observable<CompleteFilm?> {
        return Networking.shared.fetch2(route: param)
    }
}

final public class FilmSheetServiceAssembly: Assembly {
    public init() {}

    public func assemble(container: Container) {
        registerFilmSheetService(container: container)
    }

    private func registerFilmSheetService(container: Container) {
        container.register(FilmSheetServicing.self) { _ in
            return FilmSheetWeb()
        }
    }
}
