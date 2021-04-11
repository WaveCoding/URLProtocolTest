//
//  TaxiLoader.swift
//  URLProtocolTest
//
//  Created by Fabio Cuomo on 11/04/2021.
//

import Foundation

public typealias TaxiLoaderResult = Result<[CarItem], RemoteTaxiLoader.Error>

public protocol TaxiLoader {
    func load(url: URL, completion: @escaping (TaxiLoaderResult) -> Void)
}
