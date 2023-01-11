//
//  NetworkWidgetProvider.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import WidgetKit

/// `NetworkWidgetProvider` generates a timeline that consists of `NetworkWidgetEntry` entries.
struct NetworkWidgetProvider: TimelineProvider {
    /// First time, WidgetKit renders the widget's view as a placeholder.
    func placeholder(in context: Context) -> NetworkWidgetEntry {
        NetworkWidgetEntry(date: Date())
    }

    /// WidgetKit calls this method when the widget appears in transient situations. It is used to create a snapshot of your widget's content at a given time, which can then be displayed in the widget.
    func getSnapshot(in context: Context, completion: @escaping (NetworkWidgetEntry) -> Void) {
        let entry = NetworkWidgetEntry(date: Date())
        completion(entry)
    }

    /// Provides an array of timeline entries for the current time and, optionally, any future times to update a widget.
    /// /// Refreshes every `1 hour`.
    func getTimeline(in context: Context, completion: @escaping (Timeline<NetworkWidgetEntry>) -> Void) {
        Task {
            let result = await callApi()
            switch result {
            case .success(let model):
                let startOfDay = Calendar.current.startOfDay(for: Date())
                guard let afterOneHour = Calendar.current.date(byAdding: .hour, value: 1, to: startOfDay) else { return }

                let entries = [NetworkWidgetEntry(date: startOfDay, rates: model.rates),
                               NetworkWidgetEntry(date: afterOneHour, rates: model.rates)]
                let timeline = Timeline(entries: entries, policy: .atEnd)
                completion(timeline)
            case .failure: return
            }
        }
    }
}

extension NetworkWidgetProvider {
    /// Call Rates API.
    func callApi() async -> Result<ResponseModel, Error> {
        let (data, error) = await NetworkRequestHelper().call()
        guard let data = data, let decoded = try? JSONDecoder().decode(ResponseModel.self, from: data), error == nil else { return .failure(error!) }
        return .success(decoded)
    }
}

/// Error types of Rates API.
private enum BaseError: Error {
    case errorStatus
}
