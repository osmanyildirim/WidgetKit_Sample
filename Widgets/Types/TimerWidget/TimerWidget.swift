//
//  TimerWidget.swift
//  IntentExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// `TimerWidget` is a type of widget that timer.
struct TimerWidget: Widget {
    var body: some WidgetConfiguration {
        /// StaticConfiguration of TimerWidget.
        StaticConfiguration(kind: "TimerWidget", provider: TimerWidgetProvider()) { entry in
            TimerWidgetView(entry: entry)
        }
        /// Display name on Widgets Menu.
        .configurationDisplayName("Timer Widget")
        /// Description on Widgets Menu.
        .description("""
                        Displays the current time as a timer.

                        Supports small size.
                        """)
        /// Supported families of TimerWidget.
        .supportedFamilies([.systemSmall])
    }
}
