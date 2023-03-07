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
        //add name
        //add price
        //add extra data
        
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
    }
    func setConstraints(){
        
        setConstraintsOnImage()
     
    }
    
    func setConstraintsOnImage()
    {
        let leading = NSLayoutConstraint(item: itemImageLabel , attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: view.frame.width*0.14)
        let top = NSLayoutConstraint(item: itemImageLabel , attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: view.frame.height/5)
        let height = NSLayoutConstraint(item: itemImageLabel , attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.frame.height/3)
        let width = NSLayoutConstraint(item: itemImageLabel , attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.frame.height/3)

        
        self.view.addConstraints([leading,top,height,width])
    }
    
    func setAutoresizingMask(){
        itemImageLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
}
