//
//  UIViewExt.swift
//  StoreManager
//
//  Created by gaurav.mishra on 20/02/23.
//

import Foundation
import UIKit


extension UIView
{
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}
