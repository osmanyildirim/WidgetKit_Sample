//
//  MainViewModelCreator.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import Foundation

final class MainViewModelCreator: BaseViewModelCreator {
    typealias ViewModel = MainViewModel

    static func create() -> MainViewModel {
        MainViewModel()
    }
}
