//
//  HTTPMethods.swift
//  AcloConcurrency
//
//  Created by DariaMikots on 11.06.2022.
//

import Foundation

public enum HTTPMethod: String {
    case connect = "CONNECT"
    case get = "GET"
    case head = "HEAD"
    case options = "OPTIONS"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
    case trace = "TRACE"
}
