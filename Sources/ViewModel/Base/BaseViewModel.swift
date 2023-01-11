//
//  BaseViewModel.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import Foundation

protocol ViewModelHandler: AnyObject {
    func eventHandler (_ event: BaseEvents)
}

protocol BaseViewModel {
    var delegate: ViewModelHandler? { get set }

    func fetchData() -> [Pokemon]
    func handleEvent(_ event: BaseEvents)
}

enum BaseEvents {
    case passData(Pokemon)
}

extension BaseViewModel {
    func handleEvent(_ event: BaseEvents) {
        delegate?.eventHandler(event)
    }
}
