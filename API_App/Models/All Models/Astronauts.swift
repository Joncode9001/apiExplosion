//
//  Astronauts.swift
//  API_App
//
//  Created by Jonah Reinis on 1/20/23.
//

import Foundation

// MARK: - Welcome
struct Astronauts: Codable {
    let message: String
    let people: [Person]
    let number: Int
}

// MARK: - Person
struct Person: Codable {
    let name: String
    let craft: Craft
}

enum Craft: String, Codable {
    case iss = "ISS"
    case shenzhou15 = "Shenzhou 15"
}
