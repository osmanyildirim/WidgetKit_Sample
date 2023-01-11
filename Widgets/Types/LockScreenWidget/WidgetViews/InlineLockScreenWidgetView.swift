//
//  InlineLockScreenWidgetView.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// Widget view for `accessoryInline`
struct InlineLockScreenWidgetView: View {
    var body: some View {
        ViewThatFits {
            Text("Long Text for Lock Screen").font(Font.custom("HelveticaNeue", size: 15))
            Text("Short Text").font(Font.custom("HelveticaNeue", size: 15))
        }
    }
}
