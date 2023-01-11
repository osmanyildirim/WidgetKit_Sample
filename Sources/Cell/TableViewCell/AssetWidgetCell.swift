//
//  AssetWidgetCell.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import UIKit

final class AssetWidgetCell: UITableViewCell, BaseTableViewCell {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "DynamicBlack")
        view.cornerRadius(radius: 5)
        view.addSubview(titleLabel)
        view.addSubview(assetImageView)
        view.addSubview(descriptionLabel)
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textColor = UIColor(named: "HokeyPokey")
        return label
    }()

    private lazy var assetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.cornerRadius(radius: 5)
        return imageView
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
        assetImageView.image = nil
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

        assetImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.width.height.equalTo(75)
            make.leading.equalToSuperview().offset(10)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(assetImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}

extension AssetWidgetCell {
    func configure() {
        assetImageView.image = UIImage(named: "pokemon")
        titleLabel.text = "Asset Widget"
        descriptionLabel.text = """
                                   Displays this image from the App's Assets.

                                   Supports small size.
                                   """
    }
}
