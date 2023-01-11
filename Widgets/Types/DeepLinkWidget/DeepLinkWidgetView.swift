//
//  DeepLinkWidgetView.swift
//  WidgetsExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI

struct DeepLinkWidgetView: View {
    /// Entry for DeepLinkWidget's View
    var entry: DeepLinkWidgetEntry

    /// Widget family
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        if widgetFamily == .systemSmall {
            /// Deep link action for small size
            Text("widgetssample://?parameter=123").widgetURL(deeplinkURL)
        } else if widgetFamily == .systemMedium {
            /// Deep link action for medium size
            Link("widgetssample://?parameter=123", destination: deeplinkURL)
        }
    }
}

extension DeepLinkWidgetView {
    /// Deep link url
    private var deeplinkURL: URL {
        URL(string: "widgetssample://?parameter=123")!
    }
}
