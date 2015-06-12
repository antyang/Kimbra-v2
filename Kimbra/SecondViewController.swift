//
//  SecondViewController.swift
//  Kimbra
//
//  Created by Antony Yang on 6/11/15.
//  Copyright (c) 2015 Arash Namvar. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // do additional shit after loading the view
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        //dispose of any shit that can be recreated
    }
    
    var dataPassed: Float!
    var secondDataPassed: Float!
    
    var audiolevels: [Float] = [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
    var ratelevel: [Float] = [1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,]
    
    @IBOutlet weak var slider1outlet: UISlider!
    
    
    @IBAction func slider1(sender: UISlider) {
        // shit slider1 should do
        
        audioPlayer?.volume = Float(sender.value)
        audiolevels[sender.tag] = Float(sender.value)
    }
    
    
}
