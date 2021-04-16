//
//  PokedexView.swift
//  SwiftApp
//
//  Created by Андрей Калямин on 15.04.2021.
//

import SwiftUI

struct PokedexView: View {
    
    private let gridItem = [GridItem(.flexible()), GridItem(.flexible())]
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItem, spacing: 16) {
                    ForEach(viewModel.pokemon) { pokemon in
                        PokemonCell(pokemon: pokemon)
                    }
                }
            }
            .navigationTitle("Pokedex")
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PokedexView()
        }
    }
}
