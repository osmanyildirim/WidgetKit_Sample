//
//  IntentWidgetView.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

struct IntentWidgetView: View {
    /// Entry for IntentWidgetView's View
    var entry: IntentWidgetEntry

    /// Widget family
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        if let pokemon = entry.pokemon {
            ZStack(alignment: .bottom) {
                Image(uiImage: UIImage(named: pokemon.imageName)!)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .background(.white)

                Text(pokemon.name ?? "")
                    .font(font)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 5)
                    .foregroundColor(Color.white)
                    .background(Color.black.opacity(0.7))
                    .multilineTextAlignment(.center)
            }
        } else {
            /// Placeholder View
            Text("Select Pokemon from Widget's Settings")
                .font(emptyFont)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .foregroundColor(Color.white)
                .background(Color.black)
                .multilineTextAlignment(.center)
        }
    }
}

extension IntentWidgetView {
    /// Font by widget family
    private var font: Font {
        switch widgetFamily {
        case .systemSmall: return Font.custom("HelveticaNeue", size: 20)
        case .systemLarge: return Font.custom("HelveticaNeue-Semibold", size: 30)
        default: return Font.custom("HelveticaNeue-Semibold", size: 30)
        }
    }

    /// Empty font by widget family
    private var emptyFont: Font {
        switch widgetFamily {
        case .systemSmall: return Font.custom("HelveticaNeue", size: 15)
        case .systemLarge: return Font.custom("HelveticaNeue-Semibold", size: 20)
        default: return Font.custom("HelveticaNeue-Semibold", size: 20)
        }
    }
}
