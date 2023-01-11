//
//  String+Extensions.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import Foundation

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else {
            return nil
        }
        return try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
    }

    var attributedString: AttributedString {
        guard let data = data(using: .utf16), let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) else { return AttributedString(self) }
        return AttributedString(attributedString)
    }
}
