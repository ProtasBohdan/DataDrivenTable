//
//  ViewController.swift
//  DataDrivenTable
//
//  Created by protas on 1/22/20.
//  Copyright © 2020 protas. All rights reserved.
//

import UIKit

struct CustomModel {
    var title: String
    var isActionButtonHidden: Bool
}

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }

    func setupTable() {
        let section0 = Section(items: [CustomModel(title: "Cell 1_1", isActionButtonHidden: false),
                                       CustomModel(title: "Cell 1_2", isActionButtonHidden: true),
                                       CustomModel(title: "Cell 1_3", isActionButtonHidden: false)])

        let section1 = Section(items: [CustomModel(title: "Cell 2_1", isActionButtonHidden: false),
                                       CustomModel(title: "Cell 2_2", isActionButtonHidden: true),
                                       CustomModel(title: "Cell 2_3", isActionButtonHidden: false)])

        let dataSource = DataSource(sections: [section0, section1])

        let configurator = Configurator { (cell, model: CustomModel, tableView, indexPath) -> NibTableViewCell in
            cell.titleLabel.text = model.title
            cell.actionButton.isHidden = model.isActionButtonHidden
            return cell
        }

        let table = PluginTableViewController(dataSource: dataSource, configurator: configurator)

        add(child: table, container: view)
    }


}

