//
//  ItemTableViewCell.swift
//  StoreManager
//
//  Created by gaurav.mishra on 20/02/23.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    var itemImage = UIImageView()
    var itemName = UILabel()
    var itemPrice = UILabel()
    var itemExtra = UILabel()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(itemImage)
        addSubview(itemName)
        configureItemImage()
        configureItemName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureItemImage(){
        itemImage.layer.cornerRadius = 14
        itemImage.clipsToBounds = true
        
    }
    func configureItemName(){
        itemName.numberOfLines = 0
    }
}
