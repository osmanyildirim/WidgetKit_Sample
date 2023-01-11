//
//  LocationWidgetEntry.swift
//  IntentExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// TimelineEntry of LocationWidgetEntry.
struct LocationWidgetEntry: TimelineEntry {
    /// The date for WidgetKit to render LocationWidget
    var date: Date
    /// Result of current location converted to Image
    var mapImage: UIImage?
}
