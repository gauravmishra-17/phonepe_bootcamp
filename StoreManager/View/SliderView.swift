//
//  SliderView.swift
//  StoreManager
//
//  Created by gaurav.mishra on 05/03/23.
//

import UIKit



class SliderView: UIView {

    var maximumValue = 0
    var minimumValue = 0
    let slider = UISlider()
    
    init(maximumValue: Int, minimumValue: Int)
    {
        super.init(frame: .zero)

        //initialize the max and min value of the slider
        self.maximumValue = maximumValue
        self.minimumValue = minimumValue
        
        self.setUp()
        self.setUpConstraints()
        
        //activate constraints
        NSLayoutConstraint.activate(self.constraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp()
    {
        slider.minimumValue = Float(minimumValue)
        slider.maximumValue = Float(maximumValue)
        slider.setValue(Float(maximumValue), animated: false)
        slider.addTarget(self, action: #selector(self.changeValue(slider:)), for: .valueChanged)
                
        addSubview(slider)
    }
    
    func setUpConstraints()
    {
        slider.translatesAutoresizingMaskIntoConstraints = false

        
        let leading = NSLayoutConstraint(item: slider , attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 34)
        let trailing = NSLayoutConstraint(item: slider , attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -34)
        let top = NSLayoutConstraint(item: slider, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant:0 )
        
        self.addConstraint(leading)
        self.addConstraint(trailing)
        self.addConstraint(top)

    }
    
    @objc
    func changeValue(slider: UISlider)
    {
    }

    
    
    
}
