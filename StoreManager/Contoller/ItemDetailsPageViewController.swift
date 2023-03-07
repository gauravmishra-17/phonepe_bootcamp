//
//  ItemDetailsPageViewController.swift
//  StoreManager
//
//  Created by gaurav.mishra on 07/03/23.
//

import UIKit

class ItemDetailsPageViewController: UIViewController {
    
    var itemImageLabel = UIImageView()
    var itemNameLabel = UILabel()
    var itemPriceLabel = UILabel()
    var itemExtraLabel = UILabel()
    var mrpTextLabel = UILabel()
    var divider = UIView()
    
    convenience init(item:ItemsViewModel, image: UIImage?) {
        self.init()
        
        itemNameLabel.text = item.name
        itemPriceLabel.text = item.price
        itemExtraLabel.text = item.extra ?? ""
        itemImageLabel.image = image
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add subviews
        addViews()
        
        //setUp views
        setUpViews()
        
        //setConstraints
        setConstraints()
        
        //set auto resizing mask
        setAutoresizingMask()
        
        //activate constraints
        NSLayoutConstraint.activate(self.view.constraints)
        
    }
    
    func addViews()
    {
        view.addSubview(itemImageLabel)
        view.addSubview(divider)
        view.addSubview(itemNameLabel)
        view.addSubview(mrpTextLabel)
        view.addSubview(itemPriceLabel)
        view.addSubview(itemExtraLabel)
        
    }
    
    func setUpViews(){
        setUpDivider()
        setUpName()
        setUpMrp()
        setUpPrice()
        setUpExtraData()
    }
    
    func setConstraints(){
        
        setConstraintsOnImage()
        setConstraintsOnDivider()
        setConstraintsOnName()
        setConstraintsOnMrp()
        setConstraintsOnPrice()
        setConstraintsOnExtraData()
        
        
    }
    
    func setUpDivider(){
        divider.backgroundColor = UIColor(hexString: "#E6E9F6")
    }
    func setUpName(){
        itemNameLabel.font = .systemFont(ofSize: 18,weight: .semibold)
    }
    func  setUpMrp(){
        mrpTextLabel.text = "MRP:"
        mrpTextLabel.textColor = UIColor(hexString: "#A3A3A3")
        mrpTextLabel.font = .systemFont(ofSize: 14)
    }
    func  setUpPrice(){
        itemPriceLabel.font = .systemFont(ofSize: 14)
    }
    func  setUpExtraData(){
        itemExtraLabel.font = .systemFont(ofSize: 14)
        itemExtraLabel.textColor = UIColor(hexString: "#A3A3A3")
    }
    
    
    
    func setConstraintsOnImage()
    {
        let leading = NSLayoutConstraint(item: itemImageLabel , attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: view.frame.width*0.14)
        let top = NSLayoutConstraint(item: itemImageLabel , attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: view.frame.height/5)
        let height = NSLayoutConstraint(item: itemImageLabel , attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.frame.height/3)
        let width = NSLayoutConstraint(item: itemImageLabel , attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.frame.height/3)
        
        self.view.addConstraints([leading,top,height,width])
    }
    
    func setConstraintsOnDivider(){
        let leading = NSLayoutConstraint(item: divider , attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: view.frame.width*0.1)
        let trailing = NSLayoutConstraint(item: divider , attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -view.frame.width*0.1)
        let top = NSLayoutConstraint(item: divider , attribute: .top, relatedBy: .equal, toItem: itemImageLabel, attribute: .bottom, multiplier: 1, constant: 10)
        let height = NSLayoutConstraint(item:divider , attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 10)
        
        self.view.addConstraints([leading,trailing,top,height])
        
    }
    func setConstraintsOnName(){
        let leading = NSLayoutConstraint(item: itemNameLabel , attribute: .leading, relatedBy: .equal, toItem: divider, attribute: .leading, multiplier: 1, constant: view.frame.width*0.3)
        let top = NSLayoutConstraint(item: itemNameLabel , attribute: .top, relatedBy: .equal, toItem: divider, attribute: .bottom, multiplier: 1, constant: 10)
        
        
        self.view.addConstraints([leading,top])
    }
    func setConstraintsOnMrp(){
        let leading = NSLayoutConstraint(item: mrpTextLabel, attribute: .leading, relatedBy: .equal, toItem: divider, attribute: .leading, multiplier: 1, constant: view.frame.width*0.25)
        let top = NSLayoutConstraint(item: mrpTextLabel , attribute: .top, relatedBy: .equal, toItem: itemNameLabel, attribute: .bottom, multiplier: 1, constant: 10)
        
        
        self.view.addConstraints([leading,top])
        
    }
    func setConstraintsOnPrice(){
        let leading = NSLayoutConstraint(item: itemPriceLabel, attribute: .leading, relatedBy: .equal, toItem: mrpTextLabel, attribute: .trailing, multiplier: 1, constant: 10)
        let top = NSLayoutConstraint(item: itemPriceLabel , attribute: .top, relatedBy: .equal, toItem: itemNameLabel, attribute: .bottom, multiplier: 1, constant: 10)
        
        
        self.view.addConstraints([leading,top])
    }
    func setConstraintsOnExtraData(){
        let leading = NSLayoutConstraint(item: itemExtraLabel , attribute: .leading, relatedBy: .equal, toItem: divider, attribute: .leading, multiplier: 1, constant: view.frame.width*0.22)
        let top = NSLayoutConstraint(item: itemExtraLabel , attribute: .top, relatedBy: .equal, toItem: mrpTextLabel, attribute: .bottom, multiplier: 1, constant: 10)
        
        
        self.view.addConstraints([leading,top])
    }
    func setAutoresizingMask(){
        itemImageLabel.translatesAutoresizingMaskIntoConstraints = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        mrpTextLabel.translatesAutoresizingMaskIntoConstraints = false
        itemPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        itemExtraLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
