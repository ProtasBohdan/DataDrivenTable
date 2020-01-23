//
//  TextImageTableViewCell.swift
//  DataDrivenTable
//
//  Created by protas on 1/23/20.
//  Copyright © 2020 protas. All rights reserved.
//

import UIKit

class TextImageTableViewCell: UITableViewCell {

    @IBOutlet var titleImageView: UIImageView!
    @IBOutlet var infoLabel: UILabel!

    override func prepareForReuse() {
        titleImageView.image = nil
        infoLabel.text = ""
    }
    
}
