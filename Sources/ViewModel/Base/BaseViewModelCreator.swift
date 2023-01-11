//
//  BaseViewModelCreator.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import Foundation

protocol BaseViewModelCreator {
    associatedtype ViewModel

    static func create() -> ViewModel
}
