//
//  MainViewModel.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import UIKit
import WidgetKit

final class MainViewModel: BaseViewModel {
    /// Delegate of MainViewModel
    weak var delegate: ViewModelHandler?

    /// Selected IndexPaths for IntentWidget
    private var intentCellSelectedIndexes = [IndexPath]()

    /// All Pokemons from `source.json`
    private var pokemons = [Pokemon]()

    /// Initialization method
    init() {
        intentCellSelectedIndexes = getIntentCellIndexes()
    }

    /// Fetch all Pokemon from `source.json`
    func fetchData() -> [Pokemon] {
        pokemons = Bundle.main.decode(file: "source", fileType: "json", type: [Pokemon].self) ?? []
        return pokemons
    }
}

extension MainViewModel {
    /// `CoreDataWidgetCell` selected indexes
    func getCoreDataCellIndexes() -> IndexPath? {
        let allData = fetchData()
        guard let speciesText = Pokemon.readCoreDataDefaults()?.1 else { return nil }
        guard let row = allData.indexOf(keyPath: \.speciesText, equals: speciesText) else { return nil }
        return IndexPath(row: row, section: 0)
    }

    /// `FileManagerWidgetCell` selected indexes
    func getFileManagerCellIndexes() -> IndexPath? {
        let allData = fetchData()
        guard let pokemon = Pokemon.readFileManagerWidgetDefaults(), let row = allData.indexOf(item: pokemon) else { return nil }
        return IndexPath(row: row, section: 0)
    }

    /// `IntentWidgetCell` selected indexes
    func getIntentCellIndexes() -> [IndexPath] {
        let allData = fetchData()
        var indexes = [IndexPath]()

        for item in Pokemon.readIntentWidgetDefaults() {
            if let itemIndex = allData.indexOf(item: item) {
                indexes.append(IndexPath(row: itemIndex, section: 0))
            }
        }
        return indexes
    }

    /// `UserDefaultsWidgetCell` selected indexes
    func getUserDefaultsIndex() -> IndexPath? {
        let allData = fetchData()
        guard let pokemon = Pokemon.readUserDefaultsWidgetDefaults(), let row = allData.indexOf(item: pokemon) else { return nil }
        return IndexPath(row: row, section: 0)
    }
}

extension MainViewModel {
    /// Save indexes for`CoreDataWidgetCell`
    func saveCoreDataCellSelectedIndex(_ indexPath: IndexPath?) {
        guard let indexPath else { return }
        let allData = fetchData()
        guard let pokemon = allData.item(at: indexPath.row) else { return }

        CoreDataManager.shared.save(pokemon: pokemon)
        WidgetCenter.shared.reloadTimelines(ofKind: "CoreDataWidget")
    }

    /// Save indexes for`FileManagerWidgetCell`
    func saveFileManagerCellSelectedIndex(_ indexPath: IndexPath?) {
        guard let indexPath else { return }
        let allData = fetchData()
        let pokemon = allData.item(at: indexPath.row)

        guard let data = try? JSONEncoder().encode(pokemon), let stringData = String(data: data, encoding: .utf8) else { return }
        let url = FileManager.appGroup.appendingPathComponent(FileManager.Keys.FileManagerWidgetFileName.rawValue)
        try? stringData.write(to: url, atomically: false, encoding: .utf8)

        WidgetCenter.shared.reloadTimelines(ofKind: "FileManagerWidget")
    }

    /// Save indexes for`IntentWidgetCell`
    func saveIntentCellSelectedIndexes(_ indexPath: IndexPath?) {
        guard let indexPath else { return }

        if intentCellSelectedIndexes.contains(indexPath) {
            intentCellSelectedIndexes.remove(item: indexPath)
        } else {
            intentCellSelectedIndexes.append(indexPath)
        }
        saveIntentValues()
        WidgetCenter.shared.reloadTimelines(ofKind: "IntentWidget")
    }

    /// Save indexes for`UserDefaultsWidgetCell`
    func saveUserDefaultsCellSelectedIndex(_ indexPath: IndexPath?) {
        guard let indexPath else { return }
        let allData = fetchData()
        let pokemon = allData.item(at: indexPath.row)

        guard let data = try? JSONEncoder().encode(pokemon) else { return }
        UserDefaults.appGroup.set(data, forKey: UserDefaults.Keys.UserDefaultsWidgetAppDataKey.rawValue)
        WidgetCenter.shared.reloadTimelines(ofKind: "UserDefaultsWidget")
    }
}

extension MainViewModel {
    /// Save selected Pokemons to show on `SelectPokemon.intentdefinition`.
    private func saveIntentValues() {
        let indexes = intentCellSelectedIndexes.map({ $0.row })
        let selecteds = pokemons.items(indexes: indexes)
        guard let data = try? JSONEncoder().encode(selecteds) else { return }
        UserDefaults.appGroup.set(data, forKey: UserDefaults.Keys.IntentWidgetAppDataKey.rawValue)
    }
}
