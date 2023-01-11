//
//  CountdownWidgetView.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

struct CountdownWidgetView: View {
    /// Entry for CountdownWidget's View
    var entry: CountdownWidgetEntry

    /// Widget family
    @Environment(\.widgetFamily) var widgetFamily
    
    /// Color scheme
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            colors.0
            VStack {
                if let endDate = entry.endDate {
                    Text(endDate, style: .timer)
                        .multilineTextAlignment(.center)
                        .font(font)
                        .foregroundColor(colors.1)
                } else {
                    /// Placeholder View
                    Text("Timer finished")
                        .multilineTextAlignment(.center)
                        .font(font)
                        .foregroundColor(colors.1)
                }
            }
        }
    }
}

extension CountdownWidgetView {
    /// Colors by color scheme and widget family
    private var colors: (Color, Color) {
        let backgroundColor = colorScheme == .dark ? Color.black : Color.gray.opacity(0.5)
        let smallTextColor = colorScheme == .dark ? Color.yellow : Color.black
        let mediumTextColor = colorScheme == .dark ? Color.white : Color.blue
        let largeTextColor = colorScheme == .dark ? Color.orange : Color.red

        switch widgetFamily {
        case .systemSmall: return (backgroundColor, smallTextColor)
        case .systemMedium: return (backgroundColor, mediumTextColor)
        case .systemLarge: return (backgroundColor, largeTextColor)
        default: return (backgroundColor, smallTextColor)
        }
    }

    /// Font by widget family
    private var font: Font {
        switch widgetFamily {
        case .systemSmall: return Font.custom("HelveticaNeue", size: 15)
        case .systemMedium: return Font.custom("HelveticaNeue-Semibold", size: 20)
        case .systemLarge: return Font.custom("HelveticaNeue-Bold", size: 30)
        default: return Font.custom("HelveticaNeue-Bold", size: 30)
        }
    }
}
