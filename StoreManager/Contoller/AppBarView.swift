//
//  AppBarView.swift
//  StoreManager
//
//  Created by gaurav.mishra on 22/02/23.
//

import UIKit

class AppBarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //create app bar view
        createAppBarView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func createAppBarView(){
        
        //set background color and size of appbar
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(hexString: "#E6E9F6")
        self.addSubview(backgroundView)
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint1 = NSLayoutConstraint(item: backgroundView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
    
        let constraint2 = NSLayoutConstraint(item: backgroundView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)

        
        let constraint3 = NSLayoutConstraint(item: backgroundView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 143)
        
        let constraint4 = NSLayoutConstraint(item: backgroundView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
    
        
        self.addConstraint(constraint1)
        self.addConstraint(constraint2)
        self.addConstraint(constraint3)
        self.addConstraint(constraint4)
        
        NSLayoutConstraint.activate(self.constraints)
        
        
        
        //create Title text
        
        
        //create Filter text
        //create Search bar UI
    }

}



extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}
