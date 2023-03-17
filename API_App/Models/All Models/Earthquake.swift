//
//  Earthquake.swift
//  API_App
//
//  Created by Jonah Reinis on 1/20/23.
//

import Foundation


// MARK: - Welcome
struct Earthquakes: Codable {
    let type: String
    let metadata: Metadata
    let features: [Earthquake]
    let bbox: [Double]
}

// MARK: - Feature
struct Earthquake: Codable {
    let type: String
    let properties: Properties
    let geometry: Geometry
    let id: String
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: String
    let coordinates: [Double]
}

// MARK: - Properties
struct Properties: Codable {
    let mag: Double
    let place: String
    let time, updated: Int
    
    let url: String
    let detail: String
    
    let type, title: String
}

// MARK: - Metadata
struct Metadata: Codable {
    let generated: Int
    let url: String
    let title: String
    let status: Int
    let api: String
    let count: Int
}
