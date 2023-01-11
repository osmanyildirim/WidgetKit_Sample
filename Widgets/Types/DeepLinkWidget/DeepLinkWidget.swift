//
//  DeepLinkWidget.swift
//  WidgetsExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// `DeepLinkWidget` is a type of widget that deep link actions.
struct DeepLinkWidget: Widget {
    var body: some WidgetConfiguration {
        /// StaticConfiguration of DeepLinkWidget.
        StaticConfiguration(kind: "DeepLinkWidget", provider: DeepLinkWidgetProvider()) { entry in
            DeepLinkWidgetView(entry: entry)
        }
        /// Display name on Widgets Menu.
        .configurationDisplayName("Deep Link Widget")
        /// Description on Widgets Menu.
        .description("""
                        Navigates deep link url.

                        This widget supports small and medium sizes.
                        """)
        /// Supported families of DeepLinkWidget.
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
