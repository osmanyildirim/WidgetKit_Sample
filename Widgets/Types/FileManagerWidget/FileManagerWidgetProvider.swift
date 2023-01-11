//
//  FileManagerWidgetProvider.swift
//  IntentExtension
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// `FileManagerWidgetProvider` generates a timeline that consists of `FileManagerWidgetEntry` entries.
struct FileManagerWidgetProvider: TimelineProvider {
    /// First time, WidgetKit renders the widget's view as a placeholder.
    func placeholder(in context: Context) -> FileManagerWidgetEntry {
        FileManagerWidgetEntry(date: Date(), pokemon: nil)
    }

    /// WidgetKit calls this method when the widget appears in transient situations. It is used to create a snapshot of your widget's content at a given time, which can then be displayed in the widget.
    func getSnapshot(in context: Context, completion: @escaping (FileManagerWidgetEntry) -> Void) {
        let entry = FileManagerWidgetEntry(date: Date(), pokemon: Pokemon.readFileManagerWidgetDefaults())
        completion(entry)
    }

    /// Provides an array of timeline entries for the current time and, optionally, any future times to update a widget.
    func getTimeline(in context: Context, completion: @escaping (Timeline<FileManagerWidgetEntry>) -> Void) {
        let entries = [FileManagerWidgetEntry(date: Date(), pokemon: Pokemon.readFileManagerWidgetDefaults())]
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}
