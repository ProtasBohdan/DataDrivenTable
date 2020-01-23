//
//  UIViewController + Extensions.swift
//  DataDrivenTable
//
//  Created by protas on 1/23/20.
//  Copyright © 2020 protas. All rights reserved.
//

import UIKit

extension UIViewController {

    func add(child: UIViewController, container: UIView, configure: (_ childView: UIView) -> Void = { _ in }) {
        addChild(child)
        container.addSubview(child.view)
        configure(child.view)
        child.didMove(toParent: self)
    }

    
}

