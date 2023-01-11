//
//  URLImageWidget.swift
//  IntentExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// `NetworkWidget` is a type of widget that random image from API.
struct URLImageWidget: Widget {
    var body: some WidgetConfiguration {
        /// StaticConfiguration of URLImageWidget.
        StaticConfiguration(kind: "URLImageWidget", provider: URLImageWidgetProvider()) { entry in
            URLImageWidgetView(entry: entry)
        }
        /// Display name on Widgets Menu.
        .configurationDisplayName("URLImage Widget")
        /// Description on Widgets Menu.
        .description("""
                        Widget request API and displays random Pokemon image.
                        Refreshes every 2 hours.
                        
                        Supports large size.
                        """)
        /// Supported families of URLImageWidget.
        .supportedFamilies([.systemLarge])
    }
}
