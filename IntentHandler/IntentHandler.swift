//
//  IntentHandler.swift
//  IntentHandler
//
//  Created by Osman Yıldırım
//

import Intents

/// IntentHandler for `IntentWidget`
final class IntentHandler: INExtension, SelectPokemonIntentHandling {
    func providePokemonOptionsCollection(for intent: SelectPokemonIntent, with completion: @escaping (INObjectCollection<PokemonType>?, Error?) -> Void) {
        let pokemons = Pokemon.readIntentWidgetDefaults().map { PokemonType(identifier: $0.name, display: $0.name ?? "") }
        let collection = INObjectCollection(items: pokemons)
        completion(collection, nil)
    }
}
