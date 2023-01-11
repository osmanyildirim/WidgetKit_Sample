//
//  MainViewController.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()

    var viewModel: MainViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupLayout()

        tableView.register(AssetWidgetCell.self, forCellReuseIdentifier: "AssetWidgetCell")
        tableView.register(CoreDataWidgetCell.self, forCellReuseIdentifier: "CoreDataWidgetCell")
        tableView.register(CountdownWidgetCell.self, forCellReuseIdentifier: "CountdownWidgetCell")
        tableView.register(DeepLinkWidgetCell.self, forCellReuseIdentifier: "DeepLinkWidgetCell")
        tableView.register(IntentWidgetCell.self, forCellReuseIdentifier: "IntentWidgetCell")
        tableView.register(FileManagerWidgetCell.self, forCellReuseIdentifier: "FileManagerWidgetCell")
        tableView.register(LocationWidgetCell.self, forCellReuseIdentifier: "LocationWidgetCell")
        tableView.register(LockScreenWidgetCell.self, forCellReuseIdentifier: "LockScreenWidgetCell")
        tableView.register(NetworkWidgetCell.self, forCellReuseIdentifier: "NetworkWidgetCell")
        tableView.register(TimerWidgetCell.self, forCellReuseIdentifier: "TimerWidgetCell")
        tableView.register(URLImageWidgetCell.self, forCellReuseIdentifier: "URLImageWidgetCell")
        tableView.register(UserDefaultsWidgetCell.self, forCellReuseIdentifier: "UserDefaultsWidgetCell")
        tableView.dataSource = self
    }

    func setupViews() {
        view.backgroundColor = UIColor(named: "ChaosBlack")
        view.addSubview(tableView)
        tableView.keyboardDismissMode = .interactive
    }

    func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { 1 }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 12 }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0, let cell = tableView.dequeueReusableCell(withIdentifier: "AssetWidgetCell", for: indexPath) as? AssetWidgetCell {
            cell.configure()
            return cell
        } else if indexPath.row == 1, let cell = tableView.dequeueReusableCell(withIdentifier: "CoreDataWidgetCell", for: indexPath) as? CoreDataWidgetCell {
            cell.configure(viewModel?.fetchData() ?? [], selectedIndex: viewModel?.getCoreDataCellIndexes())
            cell.selectionHandler = { index in
                self.viewModel?.saveCoreDataCellSelectedIndex(index)
                self.tableView.reloadRows(at: [indexPath], with: .none)
            }
            return cell
        } else if indexPath.row == 2, let cell = tableView.dequeueReusableCell(withIdentifier: "CountdownWidgetCell", for: indexPath) as? CountdownWidgetCell {
            cell.configure()
            return cell
        } else if indexPath.row == 3, let cell = tableView.dequeueReusableCell(withIdentifier: "DeepLinkWidgetCell", for: indexPath) as? DeepLinkWidgetCell {
            cell.configure()
            return cell
        } else if indexPath.row == 4, let cell = tableView.dequeueReusableCell(withIdentifier: "FileManagerWidgetCell", for: indexPath) as? FileManagerWidgetCell {
            cell.configure(viewModel?.fetchData() ?? [], selectedIndex: viewModel?.getFileManagerCellIndexes())
            cell.selectionHandler = { index in
                self.viewModel?.saveFileManagerCellSelectedIndex(index)
                self.tableView.reloadRows(at: [indexPath], with: .none)
            }
            return cell
        } else if indexPath.row == 5, let cell = tableView.dequeueReusableCell(withIdentifier: "IntentWidgetCell", for: indexPath) as? IntentWidgetCell {
            cell.configure(viewModel?.fetchData() ?? [], selectedIndexes: viewModel?.getIntentCellIndexes())
            cell.selectionHandler = { index in
                self.viewModel?.saveIntentCellSelectedIndexes(index)
                self.tableView.reloadRows(at: [indexPath], with: .none)
            }
            return cell
        } else if indexPath.row == 6, let cell = tableView.dequeueReusableCell(withIdentifier: "LocationWidgetCell", for: indexPath) as? LocationWidgetCell {
            cell.configure()
            return cell
        } else if indexPath.row == 7, let cell = tableView.dequeueReusableCell(withIdentifier: "LockScreenWidgetCell", for: indexPath) as? LockScreenWidgetCell {
            cell.configure()
            return cell
        } else if indexPath.row == 8, let cell = tableView.dequeueReusableCell(withIdentifier: "NetworkWidgetCell", for: indexPath) as? NetworkWidgetCell {
            cell.configure()
            return cell
        } else if indexPath.row == 9, let cell = tableView.dequeueReusableCell(withIdentifier: "TimerWidgetCell", for: indexPath) as? TimerWidgetCell {
            cell.configure()
            return cell
        } else if indexPath.row == 10, let cell = tableView.dequeueReusableCell(withIdentifier: "URLImageWidgetCell", for: indexPath) as? URLImageWidgetCell {
            cell.configure()
            return cell
        } else if indexPath.row == 11, let cell = tableView.dequeueReusableCell(withIdentifier: "UserDefaultsWidgetCell", for: indexPath) as? UserDefaultsWidgetCell {
            cell.configure(viewModel?.fetchData() ?? [], selectedIndex: viewModel?.getUserDefaultsIndex())
            cell.selectionHandler = { index in
                self.viewModel?.saveUserDefaultsCellSelectedIndex(index)
                self.tableView.reloadRows(at: [indexPath], with: .none)
            }
            return cell
        }
        return UITableViewCell()
    }
}
