//
//  PlaceModel.swift
//  AlcoConcurrency
//
//  Created by DariaMikots on 15.06.2022.
//

import Foundation
struct PlaceModel: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    let image: String
}

extension PlaceModel {
    static var mock = PlaceModel(id: UUID(), name: "Bar", description: "My favorite bar", image: "https://img.restoclub.ru/uploads/place/c/6/7/0/c670f3405f20b2c8513908b467548849_w958_h835--big.jpg")
}
