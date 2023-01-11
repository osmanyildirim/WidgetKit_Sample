//
//  CountdownWidgetEntry.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// TimelineEntry of CountdownWidget.
struct CountdownWidgetEntry: TimelineEntry {
    /// The date for WidgetKit to render CountdownWidget
    let date: Date
    /// The end date for WidgetKit to render CountdownWidget
    var endDate: Date?
}
