//
//  SmallLockScreenWidgetView.swift
//  WidgetsExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// Widget view for `accessoryInline`
struct SmallLockScreenWidgetView: View {
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
