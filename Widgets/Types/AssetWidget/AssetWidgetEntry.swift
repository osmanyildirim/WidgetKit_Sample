//
//  AssetWidgetEntry.swift
//  WidgetsExtension
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// TimelineEntry of AssetWidget.
struct AssetWidgetEntry: TimelineEntry {
    /// The date for WidgetKit to render AssetWidget
    var date: Date
    
    /// Image name to display on AssetWidget's Image
    var imageName: String
}
