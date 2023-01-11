//
//  IntentWidgetProvider.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// `IntentWidgetProvider` generates a timeline that consists of `IntentWidgetEntry` entries.
struct IntentWidgetProvider: IntentTimelineProvider {
    /// First time, WidgetKit renders the widget's view as a placeholder.
    func placeholder(in context: Context) -> IntentWidgetEntry {
        IntentWidgetEntry(date: Date(), pokemon: nil)
    }

    /// WidgetKit calls this method when the widget appears in transient situations. It is used to create a snapshot of your widget's content at a given time, which can then be displayed in the widget.
    func getSnapshot(for configuration: SelectPokemonIntent, in context: Context, completion: @escaping (IntentWidgetEntry) -> Void) {
        let entry = IntentWidgetEntry(date: Date(), pokemon: Pokemon.get(for: configuration))
        completion(entry)
    }

    /// Provides an array of timeline entries for the current time and, optionally, any future times to update a widget.
    func getTimeline(for configuration: SelectPokemonIntent, in context: Context, completion: @escaping (Timeline<IntentWidgetEntry>) -> Void) {
        let entries = [IntentWidgetEntry(date: Date(), pokemon: Pokemon.get(for: configuration))]
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}
