//
//  CoreDataWidget.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// `CoreDataWidget` is a type of widget that read from Core Data.
struct CoreDataWidget: Widget {
    var body: some WidgetConfiguration {
        /// StaticConfiguration of CoreDataWidget.
        StaticConfiguration(kind: "CoreDataWidget", provider: CoreDataWidgetProvider()) { entry in
            CoreDataWidgetView(entry: entry)
        }
        /// Display name on Widgets Menu.
        .configurationDisplayName("Core Data Widget")
        /// Description on Widgets Menu.
        .description("""
                        Image and species of the selected Pokemon are save in Core Data and displays on the Widget.

                        Supports small size.
                        """)
        /// Supported families of AssetWidget.
        .supportedFamilies([.systemSmall])
    }
}
