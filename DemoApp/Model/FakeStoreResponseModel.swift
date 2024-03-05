//
//  FakeStoreResponseModel.swift
//  DemoApp
//
//  Created by Devesh Pandey on 03/03/24.
//  Copyright © 2024 Bellubis-WS29. All rights reserved.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fakeStoreResponse = try? JSONDecoder().decode(FakeStoreResponse.self, from: jsonData)

import Foundation

// MARK: - FakeStoreResponseElement
struct FakeStoreResponseElement: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: Category
    let image: String
    let rating: Rating
}

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

typealias FakeStoreResponse = [FakeStoreResponseElement]
