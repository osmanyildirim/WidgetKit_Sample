//
//  IntentWidget.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// `IntentWidget` is a type of widget that select from `SelectPokemon.intentdefinition`.
struct IntentWidget: Widget {
    var body: some WidgetConfiguration {
        /// IntentConfiguration of IntentWidget.
        IntentConfiguration(kind: "IntentWidget", intent: SelectPokemonIntent.self, provider: IntentWidgetProvider()) { entry in
            IntentWidgetView(entry: entry)
        }
        /// Display name on Widgets Menu.
        .configurationDisplayName("Intent Widget")
        /// Description on Widgets Menu.
        .description("""
                        Selected Pokemons from the App are passed with UserDefaults for selection to `SelectPokemon.intentdefinition`.
                        You can choose Pokemon from Widget's settings.

                        Supports small and large sizes.
                        """)
        /// Supported families of IntentWidget.
        .supportedFamilies([.systemSmall, .systemLarge])
    }
}
