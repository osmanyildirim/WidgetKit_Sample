//
//  CountdownWidgetProvider.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// `CountdownWidgetProvider` generates a timeline that consists of `CountdownWidgetEntry` entries.
struct CountdownWidgetProvider: TimelineProvider {
    /// First time, WidgetKit renders the widget's view as a placeholder.
    func placeholder(in context: Context) -> CountdownWidgetEntry {
        CountdownWidgetEntry(date: Date())
    }
    
    /// WidgetKit calls this method when the widget appears in transient situations. It is used to create a snapshot of your widget's content at a given time, which can then be displayed in the widget.
    func getSnapshot(in context: Context, completion: @escaping (CountdownWidgetEntry) -> Void) {
        let entry = CountdownWidgetEntry(date: Date())
        completion(entry)
    }

    /// Provides an array of timeline entries for the current time and, optionally, any future times to update a widget.
    /// Refreshes `every second`.
    func getTimeline(in context: Context, completion: @escaping (Timeline<CountdownWidgetEntry>) -> Void) {
        let currentDate = Date()

        let value: Int = UserDefaults.appGroup.value(forKey: UserDefaults.Keys.CountdownWidgetAppDataKey.rawValue) as? Int ?? 60
        guard let endDate = Calendar.current.date(byAdding: .second, value: value, to: currentDate) else { return }

        let entries = [
            CountdownWidgetEntry(date: currentDate, endDate: endDate),
            CountdownWidgetEntry(date: endDate)
        ]

        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}
