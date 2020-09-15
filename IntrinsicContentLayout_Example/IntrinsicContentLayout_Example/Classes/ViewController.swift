//
//  ViewController.swift
//  IntrinsicContentLayout_Example
//
//  Created by Gaétan Zanella on 05/03/2019.
//  Copyright © 2019 Fabernovel. All rights reserved.
//

import UIKit
import IntrinsicContentLayout

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private lazy var sizingCell = TableViewCell(frame: .zero)

    // MARK: - UIViewController

    override func loadView() {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 0
        view = tableView
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell")!
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        200
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        sizingCell.sizeThatFits(CGSize(width: tableView.bounds.width, height: .greatestFiniteMagnitude)).height
    }
}

