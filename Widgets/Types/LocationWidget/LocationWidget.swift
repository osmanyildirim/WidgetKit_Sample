//
//  LocationWidget.swift
//  IntentExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// `LocationWidget` is a type of widget that show current location.
struct LocationWidget: Widget {
    var body: some WidgetConfiguration {
        /// StaticConfiguration of LocationWidget.
        StaticConfiguration(kind: "LocationWidget", provider: LocationWidgetProvider()) { entry in
            LocationWidgetView(entry: entry)
        }
        /// Display name on Widgets Menu.
        .configurationDisplayName("Location Widget")
        /// Description on Widgets Menu.
        .description("""
                        Displays current location.
                        Refreshes every 5 minutes.

                        This widget supports small and medium sizes.
                        """)
        /// Supported families of IntentWidget.
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
