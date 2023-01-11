//
//  Array+Extensions.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import Foundation

extension Array {
    func item(at index: Int) -> Element? {
        if Int(index) >= count {
            return nil
        }
        return self[index]
    }
    
    func item<Value: Comparable>(keyPath: KeyPath<Element, Value>, equals: Value) -> Element? {
        first { $0[keyPath: keyPath] == equals }
    }
    
    func items(indexes: [Int]) -> [Element] {
        enumerated().filter { indexes.contains($0.offset) }.map { $0.element }
    }

    mutating func remove(item: Element) where Element: Equatable {
        removeAll(where: { $0 == item })
    }

    func indexOf(item: Element) -> Int? where Element: Equatable {
        firstIndex(of: item)
    }
    
    func indexOf<Value: Equatable>(keyPath: KeyPath<Element, Value>, equals: Value) -> Int? where Element: Equatable {
        for item in self where item[keyPath: keyPath] == equals {
            return firstIndex(of: item)
        }
        return nil
    }
}
