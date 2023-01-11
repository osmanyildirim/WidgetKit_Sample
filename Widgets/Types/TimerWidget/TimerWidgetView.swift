//
//  TimerWidgetView.swift
//  IntentExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI
import WidgetKit

struct TimerWidgetView: View {
    /// Entry for TimerWidgetView's View
    var entry: TimerWidgetEntry

    var body: some View {
        VStack {
            Text(entry.date.hour).frame(maxWidth: .infinity).font(Font.custom("HelveticaNeue-Bold", size: 60)).foregroundColor(.white)
            Text(entry.date.minute).frame(maxWidth: .infinity).font(Font.custom("HelveticaNeue-Bold", size: 40)).foregroundColor(.white).padding(.bottom, 5)
            
            Text(entry.date.day).frame(maxWidth: .infinity).font(Font.custom("HelveticaNeue-Bold", size: .leastNonzeroMagnitude)).foregroundColor(.white)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.gray)
    }
}

/// Date extensions for TimerWidget
private extension Date {
    var hour: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        return formatter.string(from: self)
    }
    
    var minute: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm"
        return formatter.string(from: self)
    }
    
    var day: String {
        formatted(.dateTime.weekday(.wide))
    }
}
