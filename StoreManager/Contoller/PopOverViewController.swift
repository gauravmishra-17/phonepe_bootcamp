//
//  PopOverViewController.swift
//  StoreManager
//
//  Created by gaurav.mishra on 06/03/23.
//

import UIKit

class PopOverViewController: UIViewController {
    
    private let popOverLabel: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        popOverLabel.text = "Filtering Options"
        popOverLabel.textAlignment = .center
        popOverLabel.backgroundColor = .white
        self.preferredContentSize = CGSize(width: 300, height: 100)

        view.addSubview(popOverLabel)
        
        setupPopoverLabelConstraints()
        
        NSLayoutConstraint.activate(self.view.constraints)
    }

    private func setupPopoverLabelConstraints() {
        popOverLabel.translatesAutoresizingMaskIntoConstraints = false

        let labelTop = NSLayoutConstraint(item: popOverLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)

        let labelLeading = NSLayoutConstraint(item: popOverLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)

        let labelTrailing = NSLayoutConstraint(item: popOverLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)

        let labelBottom = NSLayoutConstraint(item: popOverLabel, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)

        view.addConstraints([labelTop, labelLeading, labelTrailing, labelBottom])
    }

    
}
