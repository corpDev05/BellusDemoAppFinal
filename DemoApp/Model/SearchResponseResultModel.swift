//
//  SearchResponseResultModel.swift
//  DemoApp
//
//  Created by Devesh Pandey on 23/01/24.
//  Copyright © 2024 Bellubis-WS29. All rights reserved.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct SearchResponseResultModel: Codable {
    let errorMessage: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let name, operatingSystem, manufacturer, color: String
}
