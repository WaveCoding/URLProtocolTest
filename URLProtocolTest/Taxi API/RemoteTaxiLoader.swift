//
//  RemoteTaxiLoader.swift
//  URLProtocolTest
//
//  Created by Fabio Cuomo on 11/04/2021.
//

import Foundation

public final class RemoteTaxiLoader: TaxiLoader {
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(client: HTTPClient) {
        self.client = client
    }
    
    public func load(url: URL, completion: @escaping (TaxiLoaderResult) -> Void) {
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case let .success(data, response):
                completion(CarItemsMapper.map(data, from: response))
            case .failure:
                completion(.failure(Error.connectivity))
            }
        }
    }
}
