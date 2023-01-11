//
//  AssetWidgetView.swift
//  WidgetsExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI

struct AssetWidgetView: View {
    /// Entry for AssetWidgetView's View
    var entry: AssetWidgetEntry

    var body: some View {
        GeometryReader { reader in
            Image(uiImage: UIImage(named: entry.imageName) ?? .init())
                .resizable()
                .frame(maxWidth: reader.size.width, maxHeight: reader.size.height)
        }
    }
}
