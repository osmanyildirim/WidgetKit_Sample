//
//  URLImageWidgetEntry.swift
//  IntentExtension
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// TimelineEntry of URLImageWidget.
struct URLImageWidgetEntry: TimelineEntry {
    /// The date for WidgetKit to render URLImageWidget
    let date: Date
}

extension URLImageWidgetEntry {
    /// API url of random Pokemon image
    var imageURL: URL? {
        let path = "https://lorempokemon.fakerapi.it/pokemon/200/200.png"
        return URL(string: path)
    }
}
