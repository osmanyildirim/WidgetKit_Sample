//
//  URLImageWidgetProvider.swift
//  IntentExtension
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// `URLImageWidgetProvider` generates a timeline that consists of `URLImageWidgetEntry` entries.
struct URLImageWidgetProvider: TimelineProvider {
    /// First time, WidgetKit renders the widget's view as a placeholder.
    func placeholder(in context: Context) -> URLImageWidgetEntry {
        URLImageWidgetEntry(date: Date())
    }

    /// WidgetKit calls this method when the widget appears in transient situations. It is used to create a snapshot of your widget's content at a given time, which can then be displayed in the widget.
    func getSnapshot(in context: Context, completion: @escaping (URLImageWidgetEntry) -> Void) {
        let entry = URLImageWidgetEntry(date: Date())
        completion(entry)
    }

    /// Provides an array of timeline entries for the current time and, optionally, any future times to update a widget.
    /// /// Refreshes every `2 hours`.
    func getTimeline(in context: Context, completion: @escaping (Timeline<URLImageWidgetEntry>) -> Void) {
        let startOfDay = Calendar.current.startOfDay(for: Date())
        guard let afterTwoHour = Calendar.current.date(byAdding: .hour, value: 2, to: startOfDay) else { return }

        let entries = [URLImageWidgetEntry(date: startOfDay),
                       URLImageWidgetEntry(date: afterTwoHour)]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
