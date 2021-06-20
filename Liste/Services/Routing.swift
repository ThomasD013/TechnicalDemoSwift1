//
//  Routing.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import Foundation
import Alamofire

struct Constants {
    static let baseURL = "https://omdbapi.com"
}

public protocol Routing {
    var baseURLString: String { get }
    var method: HTTPMethod { get }
    var queryStringParametersDefault: [String: Any] { get }
    var queryStringParameters: [String: Any]? { get }
    var encoding: ParameterEncoding { get }
}

extension Routing {
    public var baseURLString: String {
        return Constants.baseURL
    }

    public var queryStringParametersDefault: [String: Any] {
        return ["apikey": "35cd3119"]
    }

    public var encoding: ParameterEncoding {
        return URLEncoding.queryString
    }

    public var method: HTTPMethod {
        return .get
    }
    
    public var url: URL {
        let url = URL(string: baseURLString)
        if var queryParameters = queryStringParameters,
           let url = url {
            do {
                queryParameters.merge(dict: queryStringParametersDefault)
                let url = try url.asURL()
                let fakeUrlRequest = URLRequest(url: url)
                let queryFakeUrlRequest = try URLEncoding.default.encode(fakeUrlRequest, with: queryParameters)
                guard let queryUrl = queryFakeUrlRequest.url else { throw AFError.invalidURL(url: url) }
                return queryUrl
            } catch {
                print(error)
            }
        }
        return url!
    }
}
