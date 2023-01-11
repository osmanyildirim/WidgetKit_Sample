//
//  LockScreenWidgetView.swift
//  WidgetsExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

struct LockScreenWidgetView: View {
    /// Entry for LockScreenWidgetView's View
    let entry: LockScreenWidgetEntry

    /// Widget family
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        switch widgetFamily {
        case .accessoryCircular:
            CircularLockScreenWidgetView()
        case .accessoryInline:
            InlineLockScreenWidgetView()
        case .accessoryRectangular:
            RectangularLockScreenWidgetView()
        default:
            SmallLockScreenWidgetView()
        }
    }
}
