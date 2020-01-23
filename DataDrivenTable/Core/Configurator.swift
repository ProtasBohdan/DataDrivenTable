//
//  Configurator.swift
//  DataDrivenTable
//
//  Created by protas on 1/23/20.
//  Copyright © 2020 protas. All rights reserved.
//

import UIKit

protocol ConfiguratorType {
    associatedtype Item
    associatedtype Cell: UITableViewCell

    func registerCells(in tableView: UITableView)
    func reuseIdentifier(for item: Item, indexPath: IndexPath) -> String
    func configuredCell(for item: Item, tableView: UITableView, indexPath: IndexPath) -> Cell
}

struct Configurator<Item, Cell: UITableViewCell>: ConfiguratorType {
    typealias CellConfigurator = (Cell, Item, UITableView, IndexPath) -> Cell

    let configurator: CellConfigurator
    let cellReuseIdentifier = Cell.reuseIdentifier

    func reuseIdentifier(for item: Item, indexPath: IndexPath) -> String {
        return cellReuseIdentifier
    }

    func configure(cell: Cell, item: Item, tableView: UITableView, indexPath: IndexPath) -> Cell {
        return configurator(cell, item, tableView, indexPath)
    }

    func registerCells(in tableView: UITableView) {
        tableView.register(Cell.nib, forCellReuseIdentifier: cellReuseIdentifier)
    }

    func configuredCell(for item: Item, tableView: UITableView, indexPath: IndexPath) -> Cell {
        let reuseIdentifier = self.reuseIdentifier(for: item, indexPath: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! Cell
        return self.configure(cell: cell, item: item, tableView: tableView, indexPath: indexPath)
    }


}
