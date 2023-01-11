//
//  FileManagerWidget.swift
//  IntentExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// `FileManagerWidget` is a type of widget that read from File Manager.
struct FileManagerWidget: Widget {
    var body: some WidgetConfiguration {
        /// StaticConfiguration of FileManagerWidget.
        StaticConfiguration(kind: "FileManagerWidget", provider: FileManagerWidgetProvider()) { entry in
            FileManagerWidgetView(entry: entry)
        }
        /// Display name on Widgets Menu.
        .configurationDisplayName("File Manager Widget")
        /// Description on Widgets Menu.
        .description("""
                        Image and species of the selected Pokemon are save in File Manager and displays on the Widget.

                        Supports small size.
                        """)
        /// Supported families of FileManagerWidget.
        .supportedFamilies([.systemSmall])
    }
}
