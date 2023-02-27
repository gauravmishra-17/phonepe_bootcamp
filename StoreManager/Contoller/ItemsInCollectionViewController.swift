//
//  ItemsInCollectionsView.swift
//  StoreManager
//
//  Created by gaurav.mishra on 20/02/23.
//

import UIKit

class ItemsInCollectionViewController: UIViewController

{
    var collectionView: UICollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 500, height: 1000), collectionViewLayout: UICollectionViewFlowLayout())
    var itemList:[Item] = []
    {
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Loading the collection view.
        configureCollectionViewTable()
        collectionView.showsVerticalScrollIndicator = false
        
        
        //load items into the collection view
        loadItems()
        
        
        //activate constraints
        NSLayoutConstraint.activate(self.view.constraints)
    }
    
    func loadItems()
    {
        
//        ItemsService().getItems{ items in
//            self.itemList = items
//        }
        
    }
    
    func  configureCollectionViewTable()
    {
        
        //Add collection view
        view.addSubview(collectionView)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
                layout.minimumInteritemSpacing = 0
                layout.minimumLineSpacing = 29
        collectionView.collectionViewLayout = layout

        
        //register the cell
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: "ItemCollectionViewCell")
        
        
        //setup delegates
        collectionView.delegate = self
        collectionView.dataSource = self
        

        
        
        
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: collectionView , attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 30)
        let const2 = NSLayoutConstraint(item: collectionView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -30)
        let const3 = NSLayoutConstraint(item: collectionView , attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 177)
        let const4 = NSLayoutConstraint(item: collectionView , attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
//        let const5 = NSLayoutConstraint(item: collectionView , attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 500)
        
        
        self.view.addConstraint(const1)
        self.view.addConstraint(const2)
        self.view.addConstraint(const3)
        self.view.addConstraint(const4)
//        self.view.addConstraint(const5)
        
        
    }
    
    
}

extension ItemsInCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        
        let item = itemList[indexPath.row]
        
        cell.set(item: item)
        
        
        return cell
    }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 157)
        }
    
    
    
}
