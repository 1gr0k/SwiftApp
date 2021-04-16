//
//  PokemonViewModel.swift
//  SwiftApp
//
//  Created by Андрей Калямин on 15.04.2021.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchPokemon(url: baseUrl)
    }
    
    func fetchPokemon(url: String) {
        
        print(baseUrl)
        guard let url = URL(string: baseUrl) else { return }
        print(url)
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
//            guard let pokemon = try? JSONDecoder().decode([PokemonNumb].self, from: data) else { return }
            do {
                let pokemons = try JSONSerialization.jsonObject(with: data, options: []) as? [PokemonNumb] // если привести к [String: Any], то все ок
                    print("result: ", pokemons)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
            DispatchQueue.main.async {
                //self.pokemon = pokemon
            }
        }.resume()
    }
}
