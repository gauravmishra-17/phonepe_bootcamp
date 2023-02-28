//
//  ItemTableViewCell.swift
//  StoreManager
//
//  Created by gaurav.mishra on 20/02/23.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    var itemImageLabel = UIImageView()
    var itemNameLabel = UILabel()
    var itemPriceLabel = UILabel()
    var itemExtraLabel = UILabel()
    var mrpTextLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //add the different components that makes a cell
        addSubview(itemImageLabel)
        addSubview(itemNameLabel)
        addSubview(mrpTextLabel)
        addSubview(itemPriceLabel)
        addSubview(itemExtraLabel)
        
        //setup the ui components
        configureItemImage()
        configureItemName()
        configureMrpText()
        configureItemPrice()
        configureItemExtra()
        
        //activate constraints
        NSLayoutConstraint.activate(self.constraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  set(item : ItemsViewModel)
    {
//        downloadImage(from: URL(fileURLWithPath: item.image!))
        itemImageLabel.image = UIImage(named: "item-icon")
        itemNameLabel.text = item.name
        itemPriceLabel.text = item.price
        itemExtraLabel.text = item.extra ?? ""
    }
    func configureItemImage(){
        itemImageLabel.layer.cornerRadius = 14
        itemImageLabel.clipsToBounds = true
        
        itemImageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: itemImageLabel , attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let const2 = NSLayoutConstraint(item: itemImageLabel , attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 13)
        let const3 = NSLayoutConstraint(item: itemImageLabel , attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        let const4 = NSLayoutConstraint(item: itemImageLabel , attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)

        
        self.addConstraint(const1)
        self.addConstraint(const2)
        self.addConstraint(const3)
        self.addConstraint(const4)
        
    }
    func configureItemName(){
        itemNameLabel.numberOfLines = 1
        itemNameLabel.font = .systemFont(ofSize: 18,weight: .semibold)
        
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: itemNameLabel , attribute: .leading, relatedBy: .equal, toItem: itemImageLabel, attribute: .trailing, multiplier: 1, constant: 16)
        let const3 = NSLayoutConstraint(item: itemNameLabel , attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 13)
        
        
        
        self.addConstraint(const1)
        self.addConstraint(const3)
    }
    func    configureMrpText()
    
    {
        mrpTextLabel.text = "MRP:"
        mrpTextLabel.textColor = UIColor(hexString: "#A3A3A3")
        mrpTextLabel.font = .systemFont(ofSize: 14)
        
        mrpTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: mrpTextLabel , attribute: .leading, relatedBy: .equal, toItem: itemImageLabel, attribute: .trailing, multiplier: 1, constant: 16)
        let const3 = NSLayoutConstraint(item: mrpTextLabel , attribute: .top, relatedBy: .equal, toItem: itemNameLabel, attribute: .bottom, multiplier: 1, constant: 8)
        
        
        self.addConstraint(const1)
        self.addConstraint(const3)
    }
    
    
    func   configureItemPrice()
    {
        itemPriceLabel.numberOfLines = 1
        itemPriceLabel.font = .systemFont(ofSize: 14)
        
        itemPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: itemPriceLabel , attribute: .leading, relatedBy: .equal, toItem: mrpTextLabel, attribute: .trailing, multiplier: 1, constant: 5)
        let const3 = NSLayoutConstraint(item: itemPriceLabel , attribute: .top, relatedBy: .equal, toItem: itemNameLabel, attribute: .bottom, multiplier: 1, constant: 8)
        
        
        self.addConstraint(const1)
        self.addConstraint(const3)
    }
    
    
    func   configureItemExtra()
    {
        //        item.numberOfLines = 1
        itemExtraLabel.font = .systemFont(ofSize: 14)
        itemExtraLabel.textColor = UIColor(hexString: "#A3A3A3")
        
        itemExtraLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: itemExtraLabel , attribute: .leading, relatedBy: .equal, toItem: itemPriceLabel, attribute: .trailing, multiplier: 1, constant: 50)
        let const3 = NSLayoutConstraint(item: itemExtraLabel , attribute: .top, relatedBy: .equal, toItem: itemNameLabel, attribute: .bottom, multiplier: 1, constant: 8)
        
        
        self.addConstraint(const1)
        self.addConstraint(const3)
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.itemImageLabel.image = UIImage(data: data)!
            }
        }
    }
}

