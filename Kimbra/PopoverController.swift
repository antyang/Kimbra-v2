//
//  PopoverController.swift
//  Kimbra
//
//  Created by Antony Yang on 6/10/15.
//  Copyright (c) 2015 Arash Namvar. All rights reserved.
//

import UIKit
import Foundation

class PopoverController: UIViewController {
    
    var sliderValue: Float?
    
    override func viewDidLoad() {
    }
    
    
    
    @IBAction func onSliderChange(sender: UISlider) {
        sliderValue = Float(sender.value)
        
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
            var pop: PopoverController = segue.destinationViewController as! PopoverController
            println(pop.sliderValue)
    }
    
    
}

class Global {

}