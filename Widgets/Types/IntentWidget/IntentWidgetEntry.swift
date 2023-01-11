//
//  IntentWidgetEntry.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// TimelineEntry of IntentWidgetEntry.
struct IntentWidgetEntry: TimelineEntry {
    /// The date for WidgetKit to render IntentWidget
    let date: Date
    /// Selected Pokemon
    var pokemon: Pokemon?
}
