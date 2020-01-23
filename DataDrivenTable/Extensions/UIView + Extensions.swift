//
//  UIView + Extensions.swift
//  DataDrivenTable
//
//  Created by protas on 1/23/20.
//  Copyright © 2020 protas. All rights reserved.
//

import UIKit

extension UIView {

    static var reuseIdentifier: String {
        return String(describing: self.self)
    }

    static var nib: UINib {
        return UINib.init(nibName: self.reuseIdentifier, bundle: Bundle.init(for: self.self))
    }


}
