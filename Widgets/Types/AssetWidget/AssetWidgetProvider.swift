//
//  AssetWidgetProvider.swift
//  WidgetsExtension
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// `AssetWidgetProvider` generates a timeline that consists of `AssetWidgetEntry` entries.
struct AssetWidgetProvider: TimelineProvider {
    /// First time, WidgetKit renders the widget's view as a placeholder.
    func placeholder(in context: Context) -> AssetWidgetEntry {
        AssetWidgetEntry(date: Date(), imageName: "pokemon")
    }

    /// WidgetKit calls this method when the widget appears in transient situations. It is used to create a snapshot of your widget's content at a given time, which can then be displayed in the widget.
    func getSnapshot(in context: Context, completion: @escaping (AssetWidgetEntry) -> Void) {
        let entry = AssetWidgetEntry(date: Date(), imageName: "pokemon")
        completion(entry)
    }

    /// Provides an array of timeline entries for the current time and, optionally, any future times to update a widget.
    func getTimeline(in context: Context, completion: @escaping (Timeline<AssetWidgetEntry>) -> Void) {
        let entries = [AssetWidgetEntry(date: Date(), imageName: "pokemon")]
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}
