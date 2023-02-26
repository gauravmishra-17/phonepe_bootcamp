//
//  Box.swift
//  StoreManager
//
//  Created by gaurav.mishra on 26/02/23.
//

import Foundation

import Foundation


//class to setup data-binding between views and viewmodels of generic type.
final class Box<T> {
    
  //create a alias fot generic dataType T.
  typealias Listener = (T) -> Void
    
  //declare listener to set data.
  var listener: Listener?
    
  //declare value of the entity using value set to listener.
  var value: T {
    didSet {
      listener?(value)
    }
  }
    
    
  //initialization
  init(_ value: T) {
    self.value = value
  }
    
  //function to bind the new value
    func bind(_ listener:@escaping (T?) -> Void) {
      self.listener = listener
      listener(value)
    }
}
