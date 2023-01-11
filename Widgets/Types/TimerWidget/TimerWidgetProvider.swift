//
//  TimerWidgetProvider.swift
//  IntentExtension
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// `TimerWidgetProvider` generates a timeline that consists of `TimerWidgetEntry` entries.
struct TimerWidgetProvider: TimelineProvider {
    /// First time, WidgetKit renders the widget's view as a placeholder.
    func placeholder(in context: Context) -> TimerWidgetEntry {
        TimerWidgetEntry(date: Date())
    }
    
    /// WidgetKit calls this method when the widget appears in transient situations. It is used to create a snapshot of your widget's content at a given time, which can then be displayed in the widget.
    func getSnapshot(in context: Context, completion: @escaping (TimerWidgetEntry) -> Void) {
        let entry = TimerWidgetEntry(date: Date())
        completion(entry)
    }

    /// Provides an array of timeline entries for the current time and, optionally, any future times to update a widget.
    /// Create an Entry every minute until the next midnight.
    func getTimeline(in context: Context, completion: @escaping (Timeline<TimerWidgetEntry>) -> Void) {
        var entries = [TimerWidgetEntry]()
        let startOfDay = Calendar.current.startOfDay(for: Date())
        guard let startOfTomorrow = Calendar.current.date(byAdding: .day, value: 1, to: startOfDay) else { return }

        for offset in 0 ..< 60 * 24 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: offset, to: startOfDay)!
            entries.append(TimerWidgetEntry(date: entryDate))
        }

        let timeline = Timeline(entries: entries, policy: .after(startOfTomorrow))
        completion(timeline)
    }
}
