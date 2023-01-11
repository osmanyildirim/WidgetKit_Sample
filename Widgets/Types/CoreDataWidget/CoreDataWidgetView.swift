//
//  CoreDataWidgetView.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

struct CoreDataWidgetView: View {
    /// Entry for CoreDataWidgetView's View
    var entry: CoreDataWidgetEntry

    var body: some View {
        if let imageName = entry.imageName, let image = UIImage(named: imageName) {
            ZStack(alignment: .bottom) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .background(.white)

                Text(entry.species?.attributedString ?? "")
                    .frame(maxWidth: .infinity)
                    .padding(.top, 5)
                    .padding(.horizontal, 5)
                    .foregroundColor(Color.white)
                    .background(Color.black.opacity(0.7))
                    .multilineTextAlignment(.center)
            }
        } else {
            /// Placeholder View
            Text("Select Pokemon from App")
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
