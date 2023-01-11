//
//  Bundle+Extensions.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(file: String, fileType: String, type: T.Type) -> T? {
        guard let data = data(file, fileType: fileType) else { return nil }
        guard let decoded = try? JSONDecoder().decode(T.self, from: data) else { return nil }
        return decoded
    }
}

extension Bundle {
    private func path(_ resource: String, fileType: String? = nil) -> URL? {
        return url(forResource: resource, withExtension: fileType)
    }

    private func data(_ resource: String, fileType: String?) -> Data? {
        guard let url = path(resource, fileType: fileType) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        return data
    }
}
