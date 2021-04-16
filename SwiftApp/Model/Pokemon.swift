//
//  Pokemon.swift
//  SwiftApp
//
//  Created by Андрей Калямин on 15.04.2021.
//

struct Pokemon: Codable, Identifiable {
    var attack: Int?
    var defense: Int?
    var description: String?
    var height: Int?
    var id: Int?
    var imageUrl: String?
    var name: String?
    var type: String?
    var weight: Int?
}


//struct PokemonNumb: Codable {
//    let numb: [String: Pokemon]
//}

typealias PokemonNumb = [String: Pokemon]

//let MOCK_POKEMON: [Pokemon] = [
//    .init(id: 0, name: "Bulbasur", imageUrl: "1", type: "poison"),
//    .init(id: 1, name: "Ivysaur", imageUrl: "1", type: "poison"),
//    .init(id: 2, name: "Vonusaur", imageUrl: "1", type: "poison"),
//    .init(id: 3, name: "Charmander", imageUrl: "1", type: "poison"),
//    .init(id: 4, name: "Charmeleon", imageUrl: "1", type: "poison"),
//    .init(id: 5, name: "Charizard", imageUrl: "1", type: "poison")
//
//    
//]
