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
    var mrpText = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //add the different components that makes a cell
        addSubview(itemImage)
        addSubview(itemName)
        addSubview(mrpText)
        addSubview(itemPrice)
        addSubview(itemExtra)
        
        //setup the ui components
        configureItemImage()
        configureItemName()
        configureMrpText()
        configureItemPrice()
        configureItemExtra()
        
        
        NSLayoutConstraint.activate(self.constraints)
        
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
        itemImage.layer.cornerRadius = 14
        itemImage.clipsToBounds = true
        
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: itemImage , attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let const2 = NSLayoutConstraint(item: itemImage , attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 13)
        let const3 = NSLayoutConstraint(item: itemImage , attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        let const4 = NSLayoutConstraint(item: itemImage , attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)

        
        self.addConstraint(const1)
        self.addConstraint(const2)
        self.addConstraint(const3)
        self.addConstraint(const4)
        
    }
    func configureItemName(){
        itemName.numberOfLines = 1
        itemName.font = .systemFont(ofSize: 18,weight: .semibold)
        
        itemName.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: itemName , attribute: .leading, relatedBy: .equal, toItem: itemImage, attribute: .trailing, multiplier: 1, constant: 16)
        let const3 = NSLayoutConstraint(item: itemName , attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 13)
        
        
        
        self.addConstraint(const1)
        self.addConstraint(const3)
    }
    func    configureMrpText()
    
    {
        mrpText.text = "MRP:"
        mrpText.textColor = UIColor(hexString: "#A3A3A3")
        mrpText.font = .systemFont(ofSize: 14)
        
        mrpText.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: mrpText , attribute: .leading, relatedBy: .equal, toItem: itemImage, attribute: .trailing, multiplier: 1, constant: 16)
        let const3 = NSLayoutConstraint(item: mrpText , attribute: .top, relatedBy: .equal, toItem: itemName, attribute: .bottom, multiplier: 1, constant: 8)
        
        
        self.addConstraint(const1)
        self.addConstraint(const3)
    }
    
    
    func   configureItemPrice()
    {
        itemPrice.numberOfLines = 1
        itemPrice.font = .systemFont(ofSize: 14)
        
        itemPrice.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: itemPrice , attribute: .leading, relatedBy: .equal, toItem: mrpText, attribute: .trailing, multiplier: 1, constant: 5)
        let const3 = NSLayoutConstraint(item: itemPrice , attribute: .top, relatedBy: .equal, toItem: itemName, attribute: .bottom, multiplier: 1, constant: 8)
        
        
        self.addConstraint(const1)
        self.addConstraint(const3)
    }
    
    
    func   configureItemExtra()
    {
        //        item.numberOfLines = 1
        itemExtra.font = .systemFont(ofSize: 14)
        itemExtra.textColor = UIColor(hexString: "#A3A3A3")
        
        itemExtra.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: itemExtra , attribute: .leading, relatedBy: .equal, toItem: itemPrice, attribute: .trailing, multiplier: 1, constant: 50)
        let const3 = NSLayoutConstraint(item: itemExtra , attribute: .top, relatedBy: .equal, toItem: itemName, attribute: .bottom, multiplier: 1, constant: 8)
        
        
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
                self?.itemImage.image = UIImage(data: data)!
            }
        }
    }
}
