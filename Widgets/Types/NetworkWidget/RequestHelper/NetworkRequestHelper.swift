//
//  NetworkRequestHelper.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import Foundation

/// API Request helper for NetworkWidget to get USD, EUR, GBP, TRY rates.
final class NetworkRequestHelper {
    func call() async -> (Data?, Error?) {
        guard let url = URL(string: "https://api.exchangerate.host/latest?base=USD&symbols=EUR,GBP,TRY") else { return (nil, nil) }
        return await URLSession.shared.dataTask(with: url)
    }
}

private extension URLSession {
    func dataTask(with url: URL) async -> (Data?, Error?) {
        return await withUnsafeContinuation { continuation in
            self.dataTask(with: url) { data, _, error in
                continuation.resume(returning: (data, error))
            }.resume()
        }
    }
}
