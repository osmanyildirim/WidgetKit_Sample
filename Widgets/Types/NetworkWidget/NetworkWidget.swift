//
//  NetworkWidget.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// `NetworkWidget` is a type of widget that request API.
struct NetworkWidget: Widget {
    var body: some WidgetConfiguration {
        /// StaticConfiguration of NetworkWidget.
        StaticConfiguration(kind: "NetworkWidget", provider: NetworkWidgetProvider()) { entry in
            NetworkWidgetView(entry: entry)
        }
        /// Display name on Widgets Menu.
        .configurationDisplayName("Network Widget")
        /// Description on Widgets Menu.
        .description("""
                        Widget request API and displays currencies.
                        Refreshes every 1 hour.

                        Supports small and medium sizes.
                        """)
        /// Supported families of NetworkWidget.
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
