//
//  AssetWidget.swift
//  AssetWidget
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// `AssetWidget` is a type of widget that displays an image from the App's Assets.
struct AssetWidget: Widget {
    var body: some WidgetConfiguration {
        /// StaticConfiguration of AssetWidget.
        StaticConfiguration(kind: "AssetWidget", provider: AssetWidgetProvider()) { entry in
            AssetWidgetView(entry: entry)
        }
        /// Display name on Widgets Menu.
        .configurationDisplayName("Asset Widget")
        /// Description on Widgets Menu.
        .description("""
                        Displays image from the App's Assets.

                        This widget supports small size.
                        """)
        /// Supported families of AssetWidget.
        .supportedFamilies([.systemSmall])
    }
}
