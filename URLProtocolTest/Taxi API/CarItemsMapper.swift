//
//  CarItemsMapper.swift
//  URLProtocolTest
//
//  Created by Fabio Cuomo on 11/04/2021.
//

import Foundation

internal final class CarItemsMapper {
    private struct Root: Decodable {
        let items: [Item]
        
        var cars: [CarItem] {
            return items.map { $0.item }
        }
    }
    
    private struct Item: Decodable {
        let id: UUID
        let model: String?
        let brand: String?
        let latitude: Double?
        let longitude: Double?
        
        var item: CarItem {
            return CarItem(id: id, model: model, brand: brand, location: position)
        }
        
        var position: Location? {
            guard let latitude = latitude,
                  let longitude = longitude else { return nil }
            return Location(latitude: latitude, longitude: longitude)
        }
    }
    
    private static var OK_200: Int { return 200 }
    
    internal static func map(_ data: Data, from response: HTTPURLResponse) -> TaxiLoaderResult {
        guard response.statusCode == OK_200,
            let root = try? JSONDecoder().decode(Root.self, from: data) else {
            return .failure(RemoteTaxiLoader.Error.invalidData)
        }

        return .success(root.cars)
    }
}
