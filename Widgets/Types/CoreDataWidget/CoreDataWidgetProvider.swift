//
//  CoreDataWidgetProvider.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// `CoreDataWidgetProvider` generates a timeline that consists of `CoreDataWidgetEntry` entries.
struct CoreDataWidgetProvider: TimelineProvider {
    /// First time, WidgetKit renders the widget's view as a placeholder.
    func placeholder(in context: Context) -> CoreDataWidgetEntry {
        CoreDataWidgetEntry(date: Date(), imageName: nil, species: nil)
    }
    
    /// WidgetKit calls this method when the widget appears in transient situations. It is used to create a snapshot of your widget's content at a given time, which can then be displayed in the widget.
    func getSnapshot(in context: Context, completion: @escaping (CoreDataWidgetEntry) -> Void) {
        let (imageName, species) = Pokemon.readCoreDataDefaults() ?? (nil, nil)
        let entry = CoreDataWidgetEntry(date: Date(), imageName: imageName, species: species)
        completion(entry)
    }

    /// Provides an array of timeline entries for the current time and, optionally, any future times to update a widget.
    func getTimeline(in context: Context, completion: @escaping (Timeline<CoreDataWidgetEntry>) -> Void) {
        let (imageName, species) = Pokemon.readCoreDataDefaults() ?? (nil, nil)
        let entries = [CoreDataWidgetEntry(date: Date(), imageName: imageName, species: species)]
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}
