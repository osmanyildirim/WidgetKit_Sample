//
//  ResponseModel.swift
//  WidgetsExtension
//
//  Created by Osman Yıldırım
//

import SwiftUI

struct ResponseModel: Decodable {
    var rates: RatesModel?
}

struct RatesModel: Decodable {
    var EUR: Double?
    var GBP: Double?
    var TRY: Double?

    var imageEUR: UIImage {
        UIImage(named: "eur") ?? .init()
    }

    var imageGBP: UIImage {
        UIImage(named: "gbp") ?? .init()
    }

    var imageTRY: UIImage {
        UIImage(named: "try") ?? .init()
    }

    var imageUSD: UIImage {
        UIImage(named: "usd") ?? .init()
    }

    /// Longest charachter count forformatted rate amounts
    var maxCharachter: Int {
        max(String(format: "%.2f", EUR ?? 0).count, String(format: "%.2f", GBP ?? 0).count, String(format: "%.2f", TRY ?? 0).count) + 4
    }
}
