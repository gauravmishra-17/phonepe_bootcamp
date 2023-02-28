//
//  ItemsInCollectionView.swift
//  StoreManager
//
//  Created by gaurav.mishra on 27/02/23.
//

import UIKit

class ItemsInCollectionView: UIView {

    var collectionView: UICollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 500, height: 1000), collectionViewLayout: UICollectionViewFlowLayout())
    var itemList:[ItemsViewModel] = []

    
     init(itemList: [ItemsViewModel]) {
         self.itemList = itemList
         
        super.init(frame: .zero)

        // Loading the collection view.
        configureCollectionViewTable()
        collectionView.showsVerticalScrollIndicator = false
        
        //activate constraints
        NSLayoutConstraint.activate(self.constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

        
    func  configureCollectionViewTable()
    {
        
        //Add collection view
        self.addSubview(collectionView)
        
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
        
        let const1 = NSLayoutConstraint(item: collectionView , attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 30)
        let const2 = NSLayoutConstraint(item: collectionView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -30)
        let const3 = NSLayoutConstraint(item: collectionView , attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 177)
        let const4 = NSLayoutConstraint(item: collectionView , attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)

        
        
        self.addConstraint(const1)
        self.addConstraint(const2)
        self.addConstraint(const3)
        self.addConstraint(const4)
        
        
    }
    


}

extension ItemsInCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
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
