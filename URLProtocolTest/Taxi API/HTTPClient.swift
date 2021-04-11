//
//  HTTPClient.swift
//  URLProtocolTest
//
//  Created by Fabio Cuomo on 11/04/2021.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
