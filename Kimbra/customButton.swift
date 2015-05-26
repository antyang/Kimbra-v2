//
//  customButton.swift
//  Kimbra2.0
//
//  Created by Joshua Huang on 5/25/15.
//  Copyright (c) 2015 Joshua Huang. All rights reserved.
//

import Foundation
import UIKit

func getRandomColor() -> UIColor{
    
    var randomRed:CGFloat = CGFloat(drand48())
    
    var randomGreen:CGFloat = CGFloat(drand48())
    
    var randomBlue:CGFloat = CGFloat(drand48())
    
    return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    
}

class MyCustomButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 6.0;
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.layer.borderWidth = 3.0
        self.backgroundColor = UIColor.whiteColor()
        self.tintColor = UIColor.blackColor()
    }
}