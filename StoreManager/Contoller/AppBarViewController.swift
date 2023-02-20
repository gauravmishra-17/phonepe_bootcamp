//
//  AppBarViewController.swift
//  StoreManager
//
//  Created by gaurav.mishra on 20/02/23.
//

import UIKit

class AppBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //create appbar
        view.backgroundColor = UIColor(hexString: "#E6E9F6")
        view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200)
        
        //create Title
        let header = UILabel()
        header.textAlignment = .left
        header.text = "Explore"
        header.font = .systemFont(ofSize: 18,weight: .bold)
        header.frame = CGRect(x: 49, y: 35, width: 66, height: 50)
        self.view.addSubview(header)
        
        
        //create Filter text
        let filterText = UILabel()
        filterText.textAlignment = .right
        filterText.text = "Filter"
        filterText.font = .systemFont(ofSize: 16)
        filterText.textColor = UIColor(hexString: "#5DB075")
        filterText.frame = CGRect(x: 304, y: 35, width: 66, height: 50)
        self.view.addSubview(filterText)
        
        
        //searchBar in appBar
        let searchBar = UISearchBar()
//        searchBar.tintColor = .white
        searchBar.frame = CGRect(x: 34, y: 100, width: 343, height: 50)
        searchBar.backgroundColor = .white
        searchBar.searchTextField.backgroundColor = .clear
        searchBar.layer.cornerRadius = 20
        searchBar.placeholder = "Search"
        searchBar.clipsToBounds = true

        self.view.addSubview(searchBar)

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
