//
//  pop.swift
//  Kimbra
//
//  Created by Antony Yang on 6/10/15.
//  Copyright (c) 2015 Arash Namvar. All rights reserved.
//

import Foundation
import UIKit

class pop: UIViewController {
  
    var first: ViewController?
    weak var sliderOneDelegate: SliderOneDelegate?
    
    
    @IBAction func slider(sender: UISlider) {
        SliderOneDelegate?.sliderOne(self)
        first?.audioPlayer!.rate = Float(2.0)
    }
    
    
    
    
}