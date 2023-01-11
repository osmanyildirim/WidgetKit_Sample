//
//  CircularLockScreenWidgetView.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// Widget view for `accessoryCircular`
struct CircularLockScreenWidgetView: View {
    var body: some View {
        GeometryReader { reader in
            ZStack {
                AccessoryWidgetBackground()
                VStack {
                    Text("W: \(Int(reader.size.width))")
                        .font(Font.custom("HelveticaNeue", size: 15))

                    Text("H: \(Int(reader.size.height))")
                        .font(Font.custom("HelveticaNeue", size: 15))
                }
            }
        }
    }
}
