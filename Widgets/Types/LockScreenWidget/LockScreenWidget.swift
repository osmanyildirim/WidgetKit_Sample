//
//  LockScreenWidget.swift
//  WidgetsExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// `LockScreenWidget` is a type of widget that for lock screen.
struct LockScreenWidget: Widget {
    var body: some WidgetConfiguration {
        /// StaticConfiguration of LockScreenWidget.
        StaticConfiguration(kind: "LockScreenWidget", provider: LockScreenWidgetProvider()) { entry in
            LockScreenWidgetView(entry: entry)
        }
        /// Display name on Widgets Menu.
        .configurationDisplayName("Lock Screen Widget")
        /// Description on Widgets Menu.
        .description("""
                        Widgets appears on lock screen, displays own sizes.

                        Supports rectangular, circular and inline sizes.
                        """)
        /// Supported families of IntentWidget.
        .supportedFamilies([.accessoryCircular, .accessoryRectangular, .accessoryInline])
    }
}
