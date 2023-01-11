//
//  CoreDataWidgetEntry.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// TimelineEntry of CoreDataWidget.
struct CoreDataWidgetEntry: TimelineEntry {
    /// The date for WidgetKit to render CoreDataWidget
    let date: Date
    /// Image name to display on CoreDataWidget's  selected Pokemon image
    var imageName: String?
    /// Selected Pokemon's Species text to display on CoreDataWidget
    var species: String?
}
