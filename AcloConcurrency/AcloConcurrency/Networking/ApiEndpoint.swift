//
//  ApiEndpoint.swift
//  AcloConcurrency
//
//  Created by DariaMikots on 11.06.2022.
//

import Foundation
public typealias Parameters = [String: Any]
public typealias Headers = [String: String]

public enum ApiEndpoint {}

extension ApiEndpoint {
    private var scheme: String {
        "https"
    }

    private var host: String {
        ""
    }

    private var path: String {
        switch self {}
    }

    private var headers: Headers {
        var items = Headers()
        items["Content-Type"] = "application/json"
        return items
    }

    private var queryItems: [URLQueryItem]? {
        let items: [URLQueryItem] = []
        return items.isEmpty ? nil : items
    }

    var parameters: Parameters {
        let items = Parameters()
        return items
    }

    private var httpMethod: HTTPMethod {
        switch self {}
    }

    private func configureURL() -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        return components.url
    }

    var url: URL? {
        configureURL()
    }

    var urlRequest: URLRequest? {
        guard let url = url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        headers.forEach { urlRequest.setValue($1, forHTTPHeaderField: $0) }
        switch self {
        default:
            print("Other implementation...")
        }
        return urlRequest
    }

    private func encode<T: Encodable>(_ data: T) -> Data? {
        do {
            return try JSONEncoder().encode(data)
        } catch {
            return nil
        }
    }
}
