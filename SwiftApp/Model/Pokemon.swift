//
//  Pokemon.swift
//  SwiftApp
//
//  Created by Андрей Калямин on 15.04.2021.
//

struct Pokemon: Codable, Identifiable {
    let id: Int
    let name: String
    let imageURL: String
    let type: String
}


//struct PokemonNumb: Codable {
//    let numb: [String: Pokemon]
//}

typealias PokemonNumb = [String: Pokemon]

let MOCK_POKEMON: [Pokemon] = [
    .init(id: 0, name: "Bulbasur", imageURL: "1", type: "poison"),
    .init(id: 1, name: "Ivysaur", imageURL: "1", type: "poison"),
    .init(id: 2, name: "Vonusaur", imageURL: "1", type: "poison"),
    .init(id: 3, name: "Charmander", imageURL: "1", type: "poison"),
    .init(id: 4, name: "Charmeleon", imageURL: "1", type: "poison"),
    .init(id: 5, name: "Charizard", imageURL: "1", type: "poison")

    
]
