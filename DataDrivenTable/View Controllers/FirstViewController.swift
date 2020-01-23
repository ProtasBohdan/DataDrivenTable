//
//  ViewController.swift
//  DataDrivenTable
//
//  Created by protas on 1/22/20.
//  Copyright © 2020 protas. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }

    func setupTable() {
        let section0 = Section(items: [TitleButtonModel(titleText: "Cell 1_1", isActionButtonHidden: false),
                                       TitleButtonModel(titleText: "Cell 1_2", isActionButtonHidden: true),
                                       TitleButtonModel(titleText: "Cell 1_3", isActionButtonHidden: false)])

        let section1 = Section(items: [TitleButtonModel(titleText: "Cell 2_1", isActionButtonHidden: false),
                                       TitleButtonModel(titleText: "Cell 2_2", isActionButtonHidden: true),
                                       TitleButtonModel(titleText: "Cell 2_3", isActionButtonHidden: false)])

        let dataSource = DataSource(sections: [section0, section1])

        let configurator = Configurator { (cell: TextButtonTableViewCell, model: TitleButtonModel, tableView, indexPath) -> TextButtonTableViewCell in
            cell.titleLabel.text = model.titleText
            cell.actionButton.isHidden = model.isActionButtonHidden
            return cell
        }

        let table = PluginTableViewController(dataSource: dataSource, configurator: configurator)

        add(child: table, container: view)
    }


}

