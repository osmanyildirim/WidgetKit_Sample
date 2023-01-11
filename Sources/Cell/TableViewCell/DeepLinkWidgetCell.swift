//
//  DeepLinkWidgetCell.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import UIKit

final class DeepLinkWidgetCell: UITableViewCell, BaseTableViewCell {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "DynamicBlack")
        view.cornerRadius(radius: 5)
        view.addSubview(titleLabel)
        view.addSubview(deepLinkLabel)
        view.addSubview(descriptionLabel)
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textColor = UIColor(named: "HokeyPokey")
        return label
    }()

    private lazy var deepLinkLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        label.textColor = UIColor(named: "Ghost")
        return label
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
        deepLinkLabel.text?.removeAll()
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

        deepLinkLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(deepLinkLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}

extension DeepLinkWidgetCell {
    func configure() {
        titleLabel.text = "Deep Link Widget"
        deepLinkLabel.text = "widgetssample://?parameter=123"
        descriptionLabel.text = """
                                   Navigates this deep link url.

                                   Supports small and medium sizes.
                                   """
    }
}
