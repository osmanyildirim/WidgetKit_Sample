//
//  FileManagerWidgetCell.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import UIKit

final class FileManagerWidgetCell: UITableViewCell, BaseTableViewCell {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "DynamicBlack")
        view.cornerRadius(radius: 5)
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        view.addSubview(selectionLabel)
        view.addSubview(descriptionLabel)
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textColor = UIColor(named: "HokeyPokey")
        return label
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collectionView.backgroundColor = .clear
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var selectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        label.textColor = UIColor(named: "DustyGray")
        label.numberOfLines = 0
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 13)
        label.textColor = UIColor(named: "DustyGray")
        label.numberOfLines = 0
        return label
    }()

    private var data: [Pokemon]?
    
    private var selectedIndex: IndexPath?
    
    var selectionHandler: ((IndexPath) -> Void)?

    override func prepareForReuse() {
        titleLabel.text?.removeAll()
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

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 60, height: 60)

        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.register(ItemCollectionCell.self, forCellWithReuseIdentifier: "ItemCollectionCell")
        collectionView.dataSource = self
        collectionView.delegate = self
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

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(70)
        }
        
        selectionLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(10)
            make.height.equalTo(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}

extension FileManagerWidgetCell {
    func configure(_ data: [Pokemon], selectedIndex: IndexPath?) {
        self.data = data
        self.selectedIndex = selectedIndex

        titleLabel.text = "File Manager Widget"
        descriptionLabel.text = """
                                   Image and species of the selected Pokemon are save in File Manager and displays on the Widget.

                                   Supports small size.
                                   """
        collectionView.reloadData()
        
        guard let selectedIndex else { return }
        selectionLabel.attributedText = data[selectedIndex.row].abilityText.htmlToAttributedString
        
        descriptionLabel.snp.updateConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(50)
        }
    }
}

extension FileManagerWidgetCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return data?.count ?? 0 }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionCell", for: indexPath) as? ItemCollectionCell
        cell?.configure(data?[indexPath.row].image, isSelect: selectedIndex == indexPath)
        return cell ?? .init()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectionHandler?(indexPath)
    }
}
