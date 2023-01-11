//
//  BaseViewController.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import Foundation

protocol BaseViewController {
    var viewModel: BaseViewModel? { get set }
    
    func setupViews()
    func setupLayout()
}
