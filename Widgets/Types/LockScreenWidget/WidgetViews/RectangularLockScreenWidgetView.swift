//
//  RectangularLockScreenWidgetView.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// Widget view for `accessoryRectangular`
struct RectangularLockScreenWidgetView: View {
    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            GeometryReader { reader in
                Text("\(Int(reader.size.width)) x \(Int(reader.size.height))")
                    .font(Font.custom("HelveticaNeue", size: 15))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
