//
//  ViewExtention.swift
//  StaqoDemo
//
//  Created by Priyanka Kapasiya on 07/12/20.
//  
//

import Foundation
import UIKit



extension UIView {
    
    //TODO:- Will make it parametiries
    func setBorder()  {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 2
        self.layer.borderColor  = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        self.backgroundColor = .white
    }
}

extension UIImageView {
    
    func makeRounded()  {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.layer.bounds.width / 2
        self.layer.borderWidth = 1
        self.layer.borderColor  = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
    }
}


