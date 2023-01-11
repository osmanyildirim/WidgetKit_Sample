//
//  UserDefaultsWidget.swift
//  WidgetsExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// `UserDefaultsWidget` is a type of widget that read from UserDefaults.
struct UserDefaultsWidget: Widget {
    var body: some WidgetConfiguration {
        /// StaticConfiguration of UserDefaultsWidget.
        StaticConfiguration(kind: "UserDefaultsWidget", provider: UserDefaultsWidgetProvider()) { entry in
            UserDefaultsWidgetView(entry: entry)
        }
        /// Display name on Widgets Menu.
        .configurationDisplayName("UserDefaults Widget")
        /// Description on Widgets Menu.
        .description("""
                        Image and type of the selected Pokemon are save in UserDefaults and displays on the Widget.

                        Supports small size.
                        """)
        /// Supported families of AssetWidget.
        .supportedFamilies([.systemSmall])
    }
}
