//
//  WidgetsBundle.swift
//  Widgets
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

/// A WidgetBundle is a package that contains a set of widgets.
@main
struct WidgetsBundle: WidgetBundle {
    var body: some Widget {
        WidgetBundle_1().body
        WidgetBundle_2().body
    }
}

/// First part of main WidgetsBundle
struct WidgetBundle_1: WidgetBundle {
    var body: some Widget {
        AssetWidget()
        CoreDataWidget()
        CountdownWidget()
        DeepLinkWidget()
        FileManagerWidget()
        IntentWidget()
    }
}

/// Second part of main WidgetsBundle
struct WidgetBundle_2: WidgetBundle {
    var body: some Widget {
        LocationWidget()
        LockScreenWidget()
        NetworkWidget()
        TimerWidget()
        URLImageWidget()
        UserDefaultsWidget()
    }
}
