//
//  NetworkWidgetEntry.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// TimelineEntry of NetworkWidget.
struct NetworkWidgetEntry: TimelineEntry {
    /// The date for WidgetKit to render NetworkWidget
    let date: Date
    /// Rates response model from API
    var rates: RatesModel?
}
