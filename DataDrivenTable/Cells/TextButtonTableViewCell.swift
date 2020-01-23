//
//  NibTableViewCell.swift
//  DataDrivenTable
//
//  Created by protas on 1/23/20.
//  Copyright © 2020 protas. All rights reserved.
//

import UIKit

class TextButtonTableViewCell: UITableViewCell {

    @IBOutlet var actionButton: UIButton!
    @IBOutlet var titleLabel: UILabel!

    override func prepareForReuse() {
        actionButton.setTitle("", for: .normal)
        titleLabel.text = ""
    }
    
}
