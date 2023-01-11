//
//  FileManagerWidgetEntry.swift
//  IntentExtension
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// TimelineEntry of FileManagerWidget.
struct FileManagerWidgetEntry: TimelineEntry {
    /// The date for WidgetKit to render FileManagerWidget
    let date: Date
    /// Selected Pokemon
    var pokemon: Pokemon?
}
