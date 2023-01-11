//
//  MainViewControllerCreator.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import UIKit

final class MainViewControllerCreator: BaseViewControllerCreator {
    static func create() -> UIViewController {
        let viewController = MainViewController()
        viewController.viewModel = MainViewModelCreator.create()
        return viewController
    }
}
