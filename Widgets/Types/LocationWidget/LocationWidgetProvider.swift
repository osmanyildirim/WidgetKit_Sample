//
//  LocationWidgetProvider.swift
//  IntentExtension
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// `LocationWidgetProvider` generates a timeline that consists of `LocationWidgetEntry` entries.
struct LocationWidgetProvider: TimelineProvider {
    /// Location manager for find current location
    private let locationManager = WidgetLocationManager()

    /// First time, WidgetKit renders the widget's view as a placeholder.
    func placeholder(in context: Context) -> LocationWidgetEntry {
        LocationWidgetEntry(date: Date(), mapImage: nil)
    }

    /// WidgetKit calls this method when the widget appears in transient situations. It is used to create a snapshot of your widget's content at a given time, which can then be displayed in the widget.
    func getSnapshot(in context: Context, completion: @escaping (LocationWidgetEntry) -> Void) {
        locationManager.getLocation { location in
            location.toImage(size: context.displaySize) { image in
                let entry = LocationWidgetEntry(date: Date(), mapImage: image)
                completion(entry)
            }
        }
    }

    /// Provides an array of timeline entries for the current time and, optionally, any future times to update a widget.
    /// Refreshes every `5 minutes`.
    func getTimeline(in context: Context, completion: @escaping (Timeline<LocationWidgetEntry>) -> Void) {
        getSnapshot(in: context) { entry in
            let startOfDay = Calendar.current.startOfDay(for: Date())
            guard let afterFiveMinutes = Calendar.current.date(byAdding: .minute, value: 5, to: startOfDay) else { return }

            let firstEntry = LocationWidgetEntry(date: startOfDay, mapImage: entry.mapImage)
            let secondEntry = LocationWidgetEntry(date: afterFiveMinutes, mapImage: entry.mapImage)

            let timeline = Timeline(entries: [firstEntry, secondEntry], policy: .atEnd)
            completion(timeline)
        }
    }
}
