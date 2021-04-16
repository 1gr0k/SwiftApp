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
    
    
    func jsonToString(json: Any) -> String{
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
            let convertedString = String(data: data1, encoding: String.Encoding.utf8) // the data will be converted to the string
            //print(convertedString) // <-- here is ur string
            return convertedString!
        } catch let myJSONError {
            print(myJSONError)
        }
        return ""
    }
    
    func fetchPokemon(url: String) {
        
        print(baseUrl)
        guard let url = URL(string: baseUrl) else { return }
        print(url)
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            var newPokemons = [Pokemon]()
            do {
                let serialized = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
              
                newPokemons = serialized.compactMap({
                    let json = $0.value
                    let f_str = self.jsonToString(json: json)
                    let f_obj = try? JSONDecoder().decode(Pokemon.self, from: f_str.data(using: .utf8)!)
                    return f_obj
                })
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
            DispatchQueue.main.async {
                self.pokemon = newPokemons
            }
        }.resume()
    }
}
