//
//  ItemCollectionCell.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import UIKit

final class ItemCollectionCell: UICollectionViewCell, BaseCollectionCell {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.cornerRadius(radius: 5)
        view.addBorder(color: UIColor(named: "DustyGray"), width: 1)
        return view
    }()

    private lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.cornerRadius(radius: 5)
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupViews() {
        containerView.addSubview(itemImageView)
        addSubview(containerView)
    }

    func setupLayout() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        itemImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
            make.bottom.trailing.equalToSuperview().inset(10)
        }
    }
}

extension ItemCollectionCell {
    func configure(_ image: UIImage?, isSelect: Bool = false) {
        itemImageView.image = image
        containerView.backgroundColor = isSelect ? UIColor(named: "StoneCold") : .clear
    }
}
