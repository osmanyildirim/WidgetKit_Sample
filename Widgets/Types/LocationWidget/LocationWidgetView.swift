//
//  LocationWidgetView.swift
//  IntentExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI

struct LocationWidgetView: View {
    /// Entry for LocationWidget's View
    var entry: LocationWidgetEntry

    var body: some View {
        if let image = entry.mapImage {
            Image(uiImage: image)
        } else {
            /// Placeholder View
            Text("Allow Location Services")
                .font(Font.custom("HelveticaNeue", size: 15))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .foregroundColor(Color.white)
                .background(Color.black)
                .multilineTextAlignment(.center)
        }
    }
}
