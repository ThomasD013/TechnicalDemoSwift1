//
//  BaseAssembly.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import Foundation
import Swinject

class BaseAssembly: Assembly {
    var assemblies: [Assembly] { return [] }

    func assemble(container: Container) {
        assemblies.forEach { $0.assemble(container: container) }
        registerControllers(in: container)
    }

    func registerControllers(in container: Container) {}
}
