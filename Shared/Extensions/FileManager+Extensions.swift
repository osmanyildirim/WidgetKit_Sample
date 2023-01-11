//
//  FileManager+Extensions.swift
//  IntentExtension
//
//  Created by Osman Yıldırım
//

import Foundation

extension FileManager {
    static let appGroup = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.osmanyildirim.WidgetKit-Sample")!
    
    enum Keys: String {
        case FileManagerWidgetFileName = "FileManagerWidget.txt"
    }
}
