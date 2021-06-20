//
//  SearchFilmAssembly.swift
//  Liste
//
//  Created by Thomas on 27/06/2021.
//

import Swinject
import RxSwift

public protocol SearchFilmServicing {
    func call(with parameters: SearchFilmServiceParameters) -> Observable<Search?>
}

final class SearchFilmWeb: SearchFilmServicing {
    func call(with param: SearchFilmServiceParameters) -> Observable<Search?> {
        return Networking.shared.fetch2(route: param)
    }
}

final public class SearchFilmServiceAssembly: Assembly {
    public init() {}

    public func assemble(container: Container) {
        registerSearchFilmService(container: container)
    }

    private func registerSearchFilmService(container: Container) {
        container.register(SearchFilmServicing.self) { _ in
            return SearchFilmWeb()
        }
    }
}
