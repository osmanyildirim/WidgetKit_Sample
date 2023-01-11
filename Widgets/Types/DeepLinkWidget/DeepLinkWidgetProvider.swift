//
//  DeepLinkWidgetProvider.swift
//  WidgetsExtension
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// `DeepLinkWidgetProvider` generates a timeline that consists of `DeepLinkWidgetEntry` entries.
struct DeepLinkWidgetProvider: TimelineProvider {
    /// First time, WidgetKit renders the widget's view as a placeholder.
    func placeholder(in context: Context) -> DeepLinkWidgetEntry {
        DeepLinkWidgetEntry(date: Date())
    }

    /// WidgetKit calls this method when the widget appears in transient situations. It is used to create a snapshot of your widget's content at a given time, which can then be displayed in the widget.
    func getSnapshot(in context: Context, completion: @escaping (DeepLinkWidgetEntry) -> Void) {
        let entry = DeepLinkWidgetEntry(date: Date())
        completion(entry)
    }

    /// Provides an array of timeline entries for the current time and, optionally, any future times to update a widget.
    func getTimeline(in context: Context, completion: @escaping (Timeline<DeepLinkWidgetEntry>) -> Void) {
        let entries = [DeepLinkWidgetEntry(date: Date())]
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}
