//
//  UserDefaultsWidgetView.swift
//  WidgetsExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

struct UserDefaultsWidgetView: View {
    /// Entry for UserDefaultsWidgetView's View
    var entry: UserDefaultsWidgetEntry

    var body: some View {
        if let pokemon = entry.pokemon {
            ZStack(alignment: .bottom) {
                Image(uiImage: UIImage(named: pokemon.imageName)!)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .background(.white)

                Text(pokemon.typeText.attributedString)
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
