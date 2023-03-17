//
//  ISS.swift
//  API_App
//
//  Created by Jonah Reinis on 1/20/23.
//

import Foundation

// MARK: - Welcome
struct ISS: Codable {
    let message: String
    let timestamp: Int
    let issPosition: IssPosition

    enum CodingKeys: String, CodingKey {
        case message, timestamp
        case issPosition = "iss_position"
    }
}

// MARK: - IssPosition
struct IssPosition: Codable {
    let latitude, longitude: String
}
