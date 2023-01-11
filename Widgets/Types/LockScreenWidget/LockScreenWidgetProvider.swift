//
//  LockScreenWidgetProvider.swift
//  WidgetsExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// `LockScreenWidgetProvider` generates a timeline that consists of `LockScreenWidgetEntry` entries.
struct LockScreenWidgetProvider: TimelineProvider {
    /// First time, WidgetKit renders the widget's view as a placeholder.
    func placeholder(in context: Context) -> LockScreenWidgetEntry {
        return LockScreenWidgetEntry(date: Date())
    }

    /// WidgetKit calls this method when the widget appears in transient situations. It is used to create a snapshot of your widget's content at a given time, which can then be displayed in the widget.
    func getSnapshot(in context: Context, completion: @escaping (LockScreenWidgetEntry) -> Void) {
        let entry = LockScreenWidgetEntry(date: Date())
        completion(entry)
    }

    /// Provides an array of timeline entries for the current time and, optionally, any future times to update a widget.
    func getTimeline(in context: Context, completion: @escaping (Timeline<LockScreenWidgetEntry>) -> Void) {
        let entry = LockScreenWidgetEntry(date: Date())
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}
