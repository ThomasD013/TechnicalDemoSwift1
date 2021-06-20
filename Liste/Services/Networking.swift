//
//  Networking.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import Foundation
import Alamofire
import RxSwift

class Networking {
    static let shared = Networking()

    func fetch<T:Decodable>(type: T.Type, route: Routing, handler: @escaping (Result<T,Error>) -> Void) {
        AF.request(route.url,
                   method: route.method,
                   encoding: route.encoding)
                .responseData(completionHandler: { (response) in
                    switch response.result {
                    case .success(let value):
                        do {
                            let decoded = try JSONDecoder().decode(type, from: value)
                            handler(.success(decoded))
                        } catch {
                            handler(.failure(CustomError.parse(error)))
                        }
                    case .failure(let error):
                        handler(.failure(CustomError.networkError(value: error)))
                    }
                })
        }


    public func fetch2<T: Decodable>(route: Routing) -> Observable<T> {
        return Observable.create { observer -> Disposable in
            BaseService().call(route: route) { response in
                if let response = response {
                    do {
                        let decoded = try JSONDecoder().decode(T.self, from: response)
                        observer.onNext(decoded)
                        observer.onCompleted()
                    } catch {
                        observer.onError(CustomError.parse(error))
                    }
                } else {
                    observer.onError(CustomError.genericError)
                }
            }
            return Disposables.create()
        }
    }
}

public enum CustomError: Error {
    case genericError
    case parse(_ value: Error)
    case networkError(value: AFError)
}
