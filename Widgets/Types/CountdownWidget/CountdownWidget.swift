//
//  CountdownWidget.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// `CountdownWidget` is a type of widget that countdown timer.
struct CountdownWidget: Widget {
    var body: some WidgetConfiguration {
        /// StaticConfiguration of CountdownWidget.
        StaticConfiguration(kind: "CountdownWidget", provider: CountdownWidgetProvider()) { entry in
            CountdownWidgetView(entry: entry)
        }
        /// Display name on Widgets Menu.
        .configurationDisplayName("Countdown Widget")
        /// Description on Widgets Menu.
        .description("""
                        Displays countdown time in seconds.
                        The interval value entered from the App is saved in UserDefaults and the widget reads that value.

                        This widget supports small, medium, large sizes.
                        """)
    }
}
