//
//  ItemCollectionViewCell.swift
//  StoreManager
//
//  Created by gaurav.mishra on 24/02/23.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    var itemImage = UIImageView()
    var itemName = UILabel()
    var itemPrice = UILabel()
    var itemExtra = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        //add the different components that makes a cell
        addSubview(itemImage)
        addSubview(itemName)
        addSubview(itemPrice)
        
        //setup the ui components
        configureItemImage()
        configureItemName()
        configureItemPrice()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  set(item : Item)
    {
        //        downloadImage(from: URL(fileURLWithPath: item.image!))
        itemImage.image = UIImage(named: "item-icon")
        itemName.text = item.name
        itemPrice.text = item.price
        itemExtra.text = item.extra ?? ""
    }
    
    
    func configureItemImage(){
        
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: itemImage , attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let const2 = NSLayoutConstraint(item: itemImage , attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let const3 = NSLayoutConstraint(item: itemImage , attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        let const4 = NSLayoutConstraint(item: itemImage , attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        
        
        self.addConstraint(const1)
        self.addConstraint(const2)
        self.addConstraint(const3)
        self.addConstraint(const4)
        
    }
    func configureItemName(){
        itemName.numberOfLines = 1
        itemName.font = .systemFont(ofSize: 14)
        
        itemName.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: itemName , attribute: .leading, relatedBy: .equal, toItem: itemImage, attribute: .leading, multiplier: 1, constant: 0)
        let const3 = NSLayoutConstraint(item: itemName , attribute: .top, relatedBy: .equal, toItem: itemImage, attribute: .bottom, multiplier: 1, constant: 8)
        
        
        
        self.addConstraint(const1)
        self.addConstraint(const3)
    }
    
    
    
    func   configureItemPrice()
    {
        itemPrice.numberOfLines = 1
        itemPrice.font = .systemFont(ofSize: 14,weight: .semibold)
        
        itemPrice.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: itemPrice , attribute: .leading, relatedBy: .equal, toItem: itemImage, attribute: .leading, multiplier: 1, constant: 0)
        let const3 = NSLayoutConstraint(item: itemPrice , attribute: .top, relatedBy: .equal, toItem: itemName, attribute: .bottom, multiplier: 1, constant: 5)
        
        
        self.addConstraint(const1)
        self.addConstraint(const3)
    }
    
}
