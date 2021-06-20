//
//  ViewModel.swift
//  Liste
//
//  Created by Thomas on 27/06/2021.
//

import Foundation
import RxRelay
import RxSwift

open class ViewModel<Inputs> {
    public let inputs: Inputs
    public let disposeBag = DisposeBag()
    public let error = BehaviorRelay<Error?>(value: nil)

    public init(inputs: Inputs) {
        self.inputs = inputs
    }

    open func handleEvent<Data>(_ event: Event<Data>, completion: (Data) -> Void) {
        switch event {
        case .next(let response):
            completion(response)
        case .error(let error):
            self.error.accept(error)
        case .completed: ()
        }
    }
}
