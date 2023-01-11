//
//  CountdownWidgetCell.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import UIKit
import WidgetKit

final class CountdownWidgetCell: UITableViewCell, BaseTableViewCell {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "DynamicBlack")
        view.cornerRadius(radius: 5)
        view.addSubview(titleLabel)
        view.addSubview(valueTextField)
        view.addSubview(descriptionLabel)
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textColor = UIColor(named: "HokeyPokey")
        return label
    }()

    private lazy var valueTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Enter Countdown Integer Value", attributes: [.foregroundColor: UIColor(named: "DustyGray") ?? .white])
        textField.font = UIFont(name: "HelveticaNeue", size: 14)
        textField.textAlignment = .center
        textField.textColor = UIColor(named: "Ghost")
        textField.keyboardType = .numberPad
        textField.addBorder(color: UIColor(named: "Ghost"), width: 0.5)
        textField.cornerRadius(radius: 5)
        textField.delegate = self
        return textField
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 13)
        label.textColor = UIColor(named: "DustyGray")
        label.numberOfLines = 0
        return label
    }()

    override func prepareForReuse() {
        titleLabel.text?.removeAll()
        valueTextField.text?.removeAll()
        descriptionLabel.text?.removeAll()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        contentView.backgroundColor = UIColor(named: "ChaosBlack")
        selectionStyle = .none
        contentView.addSubview(containerView)
    }

    func setupLayout() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }

        valueTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.height.equalTo(35)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(valueTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}

extension CountdownWidgetCell {
    func configure() {
        titleLabel.text = "Countdown Widget"
        descriptionLabel.text = """
                                   Displays countdown time in seconds.
                                   The interval value entered from the App is saved in UserDefaults and the widget reads that value.

                                   Supports small, medium, large sizes.
                                   """
    }
}

extension CountdownWidgetCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let integerValue = Int(textField.text ?? "60")
        UserDefaults.appGroup.set(integerValue, forKey: UserDefaults.Keys.CountdownWidgetAppDataKey.rawValue)
        WidgetCenter.shared.reloadTimelines(ofKind: "CountdownWidget")
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
            return false
        }
        return true
    }
}
