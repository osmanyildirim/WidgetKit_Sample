//
//  UserDefaults+Extensions.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import Foundation

extension UserDefaults {
    static let appGroup = UserDefaults(suiteName: "group.com.osmanyildirim.WidgetKit-Sample")!

    enum Keys: String {
        case CountdownWidgetAppDataKey
        case FileManagerWidgetAppDataKey
        case IntentWidgetAppDataKey
        case UserDefaultsWidgetAppDataKey
    }
}
