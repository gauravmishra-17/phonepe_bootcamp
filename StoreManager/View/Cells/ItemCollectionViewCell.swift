//
//  ItemCollectionViewCell.swift
//  StoreManager
//
//  Created by gaurav.mishra on 24/02/23.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    var itemImageLabel = UIImageView()
    var itemNameLabel = UILabel()
    var itemPriceLabel = UILabel()
    var itemExtraLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        //add the different components that makes a cell
        addSubview(itemImageLabel)
        addSubview(itemNameLabel)
        addSubview(itemPriceLabel)
        
        //setup the ui components
        configureItemImage()
        configureItemName()
        configureItemPrice()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  set(item : ItemsViewModel)
    {
        downloadImage(imageUrl: item.image!)
        itemNameLabel.text = item.name
        itemPriceLabel.text = item.price
        itemExtraLabel.text = item.extra ?? ""
    }
    
    
    func configureItemImage(){
        
        itemImageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: itemImageLabel , attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let const2 = NSLayoutConstraint(item: itemImageLabel , attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let const3 = NSLayoutConstraint(item: itemImageLabel , attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        let const4 = NSLayoutConstraint(item: itemImageLabel , attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        
        
        self.addConstraint(const1)
        self.addConstraint(const2)
        self.addConstraint(const3)
        self.addConstraint(const4)
        
    }
    func configureItemName(){
        itemNameLabel.numberOfLines = 1
        itemNameLabel.font = .systemFont(ofSize: 14)
        
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: itemNameLabel , attribute: .leading, relatedBy: .equal, toItem: itemImageLabel, attribute: .leading, multiplier: 1, constant: 0)
        let const3 = NSLayoutConstraint(item: itemNameLabel , attribute: .top, relatedBy: .equal, toItem: itemImageLabel, attribute: .bottom, multiplier: 1, constant: 8)
        
        
        
        self.addConstraint(const1)
        self.addConstraint(const3)
    }
    
    
    
    func   configureItemPrice()
    {
        itemPriceLabel.numberOfLines = 1
        itemPriceLabel.font = .systemFont(ofSize: 14,weight: .semibold)
        
        itemPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: itemPriceLabel , attribute: .leading, relatedBy: .equal, toItem: itemImageLabel, attribute: .leading, multiplier: 1, constant: 0)
        let const3 = NSLayoutConstraint(item: itemPriceLabel , attribute: .top, relatedBy: .equal, toItem: itemNameLabel, attribute: .bottom, multiplier: 1, constant: 5)
        
        
        self.addConstraint(const1)
        self.addConstraint(const3)
    }
    
    //download image
    func downloadImage(imageUrl: String) {
        if let data = try? Data(contentsOf: URL(string: imageUrl)!) {
            if let image = UIImage(data: data) {
                Task {
                    self.itemImageLabel.image = image
                }
            }
        } else {
            Task {
                self.itemImageLabel.image =  UIImage(named: "item-icon")
            }
        }
        
    }
    
}
