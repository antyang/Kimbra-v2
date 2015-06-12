//
//  SlidersViewController.swift
//  Kimbra
//
//  Created by Antony Yang on 6/11/15.
//  Copyright (c) 2015 Arash Namvar. All rights reserved.
//

import UIKit
import Foundation

class SlidersViewController: UIViewController {
    
    weak var slidersDelegate: SlidersDelegate?
    weak var delegate: SlidersViewDelegate?
    
    @IBAction func onSlide(sender: UISlider) {
        slidersDelegate?.slideChangeMainView(self)
//        audioPlayer?.volume = Float(sender.value)
//        audiolevels[sender.tag] = Float(sender.value)
    }
    
    
    
    
}
