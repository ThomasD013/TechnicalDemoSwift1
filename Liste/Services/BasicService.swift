//
//  BasicService.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import Foundation

class BaseService: NSObject, URLSessionDelegate {
    func call(route: Routing, block: @escaping (Data?) -> Void) {
        var request = URLRequest(url: route.url)
        request.method = route.method

        let session = URLSession(configuration: .default,
                                 delegate: self,
                                 delegateQueue: nil)
        session.dataTask(with: request) { response, _, _ in
            block(response)
        }.resume()
    }
}
