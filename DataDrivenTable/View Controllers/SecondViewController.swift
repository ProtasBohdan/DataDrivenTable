//
//  SecondViewController.swift
//  DataDrivenTable
//
//  Created by protas on 1/23/20.
//  Copyright © 2020 protas. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }

    func setupTable() {
        let section0 = Section<Cell>(items: [
            .image(TitleImageModel(titleText: "Image 1", imageName: "Business")),
            .action(TitleButtonModel(titleText: "Button 1", isActionButtonHidden: false)),
            .image(TitleImageModel(titleText: "Image 2", imageName: "Delivery")),
            .image(TitleImageModel(titleText: "Image 3", imageName: "Time")),
        ])
        let section1 = Section<Cell>(items: [
            .action(TitleButtonModel(titleText: "Button 2", isActionButtonHidden: true)),
            .action(TitleButtonModel(titleText: "Button 3", isActionButtonHidden: false)),
            .action(TitleButtonModel(titleText: "Button 4", isActionButtonHidden: true))
        ])

        let configurator0 = Configurator { (cell: TextImageTableViewCell, model: TitleImageModel, tableView, indexPath) -> TextImageTableViewCell in
            cell.infoLabel.text = model.titleText
            cell.titleImageView.image = UIImage(named: model.imageName)
            return cell
        }
        let configurator1 = Configurator { (cell: TextButtonTableViewCell, model: TitleButtonModel, tableView, indexPath) -> TextButtonTableViewCell in
            cell.titleLabel.text = model.titleText
            cell.actionButton.isHidden = model.isActionButtonHidden
            return cell
        }

        let dataSource = DataSource(sections: [section0, section1])


        let aggregate = AggregateConfigurator(textImageConfigurator: configurator0, textButtonConfigurator: configurator1)
        let table = PluginTableViewController(dataSource: dataSource, configurator: aggregate)

        add(child: table, container: view)
    }


}

// MARK: - Helpers
private enum Cell {
    case image(TitleImageModel)
    case action(TitleButtonModel)
}

private struct AggregateConfigurator: ConfiguratorType {
    let textImageConfigurator: Configurator<TitleImageModel, TextImageTableViewCell>
    let textButtonConfigurator: Configurator<TitleButtonModel, TextButtonTableViewCell>

    func reuseIdentifier(for item: Cell, indexPath: IndexPath) -> String {
        switch item {
        case .image:
            return textImageConfigurator.cellReuseIdentifier
        case .action:
            return textButtonConfigurator.cellReuseIdentifier
        }
    }

    func configuredCell(for item: Cell, tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        switch item {
        case .image(let model):
            return textImageConfigurator.configuredCell(for: model, tableView: tableView, indexPath: indexPath)
        case .action(let model):
            return textButtonConfigurator.configuredCell(for: model, tableView: tableView, indexPath: indexPath)
        }
    }

    func registerCells(in tableView: UITableView) {
        textImageConfigurator.registerCells(in: tableView)
        textButtonConfigurator.registerCells(in: tableView)
    }
}
