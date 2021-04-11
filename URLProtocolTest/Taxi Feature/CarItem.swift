//
//  CarItem.swift
//  URLProtocolTest
//
//  Created by Fabio Cuomo on 11/04/2021.
//

import Foundation

public struct CarItem: Equatable {
    public let id: UUID
    public let model: String?
    public let brand: String?
    public let location: Location?
    
    internal init(id: UUID, model: String?, brand: String?, location: Location?) {
        self.id = id
        self.model = model
        self.brand = brand
        self.location = location
    }
}

public struct Location: Equatable {
    public let latitude: Double
    public let longitude: Double

    internal init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }    
}

