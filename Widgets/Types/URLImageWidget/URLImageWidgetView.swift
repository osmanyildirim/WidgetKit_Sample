//
//  URLImageWidgetView.swift
//  IntentExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

struct URLImageWidgetView: View {
    /// Entry for URLImageWidgetView's View
    var entry: URLImageWidgetEntry

    var body: some View {
        if let url = entry.imageURL, let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
            GeometryReader { reader in
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: reader.size.width, maxHeight: reader.size.height)
            }
        }
    }
}
