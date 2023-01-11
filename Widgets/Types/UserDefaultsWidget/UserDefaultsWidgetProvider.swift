//
//  UserDefaultsWidgetProvider.swift
//  WidgetsExtension
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// `UserDefaultsWidgetProvider` generates a timeline that consists of `UserDefaultsWidgetEntry` entries.
struct UserDefaultsWidgetProvider: TimelineProvider {
    /// First time, WidgetKit renders the widget's view as a placeholder.
    func placeholder(in context: Context) -> UserDefaultsWidgetEntry {
        UserDefaultsWidgetEntry(date: Date(), pokemon: nil)
    }

    /// WidgetKit calls this method when the widget appears in transient situations. It is used to create a snapshot of your widget's content at a given time, which can then be displayed in the widget.
    func getSnapshot(in context: Context, completion: @escaping (UserDefaultsWidgetEntry) -> Void) {
        let entry = UserDefaultsWidgetEntry(date: Date(), pokemon: Pokemon.readUserDefaultsWidgetDefaults())
        completion(entry)
    }

    /// Provides an array of timeline entries for the current time and, optionally, any future times to update a widget.
    func getTimeline(in context: Context, completion: @escaping (Timeline<UserDefaultsWidgetEntry>) -> Void) {
        let entries = [UserDefaultsWidgetEntry(date: Date(), pokemon: Pokemon.readUserDefaultsWidgetDefaults())]
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}
