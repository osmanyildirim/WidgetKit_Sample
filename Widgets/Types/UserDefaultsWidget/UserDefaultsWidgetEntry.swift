//
//  UserDefaultsWidgetEntry.swift
//  WidgetsExtension
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// TimelineEntry of UserDefaultsWidget.
struct UserDefaultsWidgetEntry: TimelineEntry {
    /// The date for WidgetKit to render UserDefaultsWidget
    let date: Date
    /// Selected Pokemon
    var pokemon: Pokemon?
}
