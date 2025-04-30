//
//  Model.swift
//  DesafioApi
//
//  Created by Turma02-10 on 29/04/25.
//

import Foundation

struct Disney: Codable, Identifiable {
    let id: Int
    let films: [String]
    let shortFilms: [String]
    let tvShows: [String]
    let videoGames: [String]
    let parkAttractions: [String]
    let allies: [String]
    let enemies: [String]
    let sourceUrl: String
    let name: String
    let imageUrl: String
    let createdAt: String
    let updatedAt: String
    let url: String
    let version: Int
}

