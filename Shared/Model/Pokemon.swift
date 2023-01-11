//
//  Pokemon.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import UIKit

struct Pokemon: Codable, Hashable {
    var name: String?
    var type: String?
    var ability: String?
    var species: String?
    var color: String?

    var image: UIImage? {
        guard let name = name else { return nil }
        return UIImage(named: name.lowercased())
    }

    var imageName: String {
        return name?.lowercased() ?? ""
    }

    var typeText: String {
        "<h3 style=\"color: #ffff;\">\(name ?? "") is <span style=\"color: \(color ?? "");\">\(type ?? "")</span> Pokemon</h3>"
    }

    var abilityText: String {
        "<h3 style=\"color: #ffffff;\">\(name ?? "")'s ability is <span style=\"color: \(color ?? "");\">\(ability ?? "")</span></h3>"
    }

    var speciesText: String {
        "<h3 style=\"color: #ffff;\">\(name ?? "") is the <span style=\"color: \(color ?? "");\">\(species ?? "")</span> Pokemon</h3>"
    }
}

extension Pokemon {
    static func readIntentWidgetDefaults() -> [Pokemon] {
        guard let data = UserDefaults.appGroup.object(forKey: UserDefaults.Keys.IntentWidgetAppDataKey.rawValue) as? Data,
            let pokemons = try? JSONDecoder().decode([Pokemon].self, from: data) else { return [] }
        return pokemons
    }

    static func readFileManagerWidgetDefaults() -> Pokemon? {
        let url = FileManager.appGroup.appendingPathComponent(FileManager.Keys.FileManagerWidgetFileName.rawValue)
        guard let string = try? String(contentsOf: url, encoding: .utf8), let data = string.data(using: .utf8), let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else { return nil }
        return pokemon
    }

    static func readUserDefaultsWidgetDefaults() -> Pokemon? {
        guard let data = UserDefaults.appGroup.object(forKey: UserDefaults.Keys.UserDefaultsWidgetAppDataKey.rawValue) as? Data else { return nil }
        return try? JSONDecoder().decode(Pokemon.self, from: data)
    }

    static func readCoreDataDefaults() -> (String, String)? {
        CoreDataManager.shared.fetch()
    }
}

extension Pokemon {
    static func get(for configuration: SelectPokemonIntent) -> Pokemon? {
        guard let identifier = configuration.pokemon?.identifier, let pokemon = from(identifier: identifier) else { return nil }
        return pokemon
    }

    static func from(identifier: String) -> Pokemon? {
        readIntentWidgetDefaults().first { $0.name == identifier }
    }
}
