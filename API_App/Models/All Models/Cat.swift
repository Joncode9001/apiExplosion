//
//  Cat.swift
//  API_App
//
//  Created by Jonah Reinis on 1/20/23.
//

import Foundation

// MARK: - CatElement
struct Cat: Codable {
    let status: Status
    let id, user, text: String
    let v: Int
    let source, updatedAt, type, createdAt: String
    let deleted, used: Bool
}

// MARK: - Status
struct Status: Codable {
    let verified: Bool
    let feedback: String?
    let sentCount: Int
}
