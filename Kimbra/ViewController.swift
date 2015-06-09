//
//  ViewController.swift
//  Kimbra2.0
//
//  Created by Joshua Huang on 5/25/15.
//  Copyright (c) 2015 Joshua Huang. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate, UIPopoverPresentationControllerDelegate{
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "startrecording" {
////            let controller = segue.destinationViewController as! NoteDetailsViewController
//            println("STARTED RECORDING")
////            controller.editingNote = sender as? Note
//        }
//        
//        if segue.identifier == "donerecording" {
//        println("DONE RECORDING")
//        }
//    }

    
    
    @IBAction func reset(sender: UIBarButtonItem) {
        stop_play()
        on = [0,0,0,0,0,0,0,0,0]
        filled = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        audiolevels = [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
        ratelevel = [1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,]
        counter = 0
        refresh()
    }
    
    var soundisthere = UIColor(red: 25/255, green: 166/255, blue: 200/255, alpha: 1)
    var grayed = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
    
    var on = [0,0,0,0,0,0,0,0,0]
    var filled = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var audiolevels: [Float] = [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
    var ratelevel: [Float] = [1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,]
    var counter = 0;

    @IBAction func slider(sender: UISlider) {
        audioPlayer?.volume = Float(sender.value)
        audiolevels[sender.tag] = Float(sender.value)
    }
    @IBAction func slider2(sender: UISlider) {
        audioPlayer?.rate = Float(sender.value)
        ratelevel[sender.tag] = Float(sender.value)
    }
    
    var session = AVAudioSession.sharedInstance()
    var url1: NSURL?
    var url2: NSURL?
    var url3: NSURL?
    var url4: NSURL?
    var url5: NSURL?
    var url6: NSURL?
    var url7: NSURL?
    var url8: NSURL?
    var url9: NSURL?
    var url10: NSURL?
    var audioPlayer: AVAudioPlayer?
    var audioPlayer2: AVAudioPlayer?
    var audioPlayer3: AVAudioPlayer?
    var audioPlayer4: AVAudioPlayer?
    var audioPlayer5: AVAudioPlayer?
    var audioPlayer6: AVAudioPlayer?
    var audioPlayer7: AVAudioPlayer?
    var audioPlayer8: AVAudioPlayer?
    var audioPlayer9: AVAudioPlayer?
    var audioPlayer10: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    var column = 0
    var row = 1
    var index = CGFloat(50)
    func run() {
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        print(dirPaths)
        let docsDir = dirPaths[0] as! String
        println(docsDir)
        var soundFilePath =
        docsDir.stringByAppendingPathComponent("sound\(counter).caf")
        println(soundFilePath)
        
        var soundFileURL = NSURL(fileURLWithPath: soundFilePath)
        if counter == 0 {
            url1 = soundFileURL
        }
        if counter == 2 {
            url2 = soundFileURL
        }
        if counter == 4 {
            url3 = soundFileURL
        }
        if counter == 6 {
            url4 = soundFileURL
        }
        if counter == 8 {
            url5 = soundFileURL
        }
        if counter == 10 {
            url6 = soundFileURL
        }
        if counter == 12 {
            url7 = soundFileURL
        }
        if counter == 14 {
            url8 = soundFileURL
        }
        if counter == 16 {
            url9 = soundFileURL
        }
        let recordSettings =
        [AVEncoderAudioQualityKey: AVAudioQuality.Min.rawValue,
            AVEncoderBitRateKey: 16,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0]
        
        var error: NSError?
        
        let audioSession = AVAudioSession.sharedInstance()
        audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord,
            error: &error)
        
        if let err = error {
            println("audioSession error: \(err.localizedDescription)")
        }
        
        audioRecorder = AVAudioRecorder(URL: soundFileURL,
            settings: recordSettings as [NSObject : AnyObject], error: &error)
        
        if let err = error {
            println("audioSession error: \(err.localizedDescription)")
        } else {
            audioRecorder?.prepareToRecord()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        println("FULE")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.backgroundColor = grayed
        button2.backgroundColor = grayed
        button3.backgroundColor = grayed
        button4.backgroundColor = grayed
        button5.backgroundColor = grayed
        button6.backgroundColor = grayed
        button7.backgroundColor = grayed
        button8.backgroundColor = grayed
        button9.backgroundColor = grayed
        button1.setTitleColor(grayed, forState: .Normal)
        button2.setTitleColor(grayed, forState: .Normal)
        button3.setTitleColor(grayed, forState: .Normal)
        button4.setTitleColor(grayed, forState: .Normal)
        button5.setTitleColor(grayed, forState: .Normal)
        button6.setTitleColor(grayed, forState: .Normal)
        button7.setTitleColor(grayed, forState: .Normal)
        button8.setTitleColor(grayed, forState: .Normal)
        button9.setTitleColor(grayed, forState: .Normal)
        button1.layer.cornerRadius = 6.0
        button2.layer.cornerRadius = 6.0
        button3.layer.cornerRadius = 6.0
        button4.layer.cornerRadius = 6.0
        button5.layer.cornerRadius = 6.0
        button6.layer.cornerRadius = 6.0
        button7.layer.cornerRadius = 6.0
        button8.layer.cornerRadius = 6.0
        button9.layer.cornerRadius = 6.0
        
        var nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes =  [ NSFontAttributeName: UIFont(name: "OpenSans-Bold", size: 36)!,  NSForegroundColorAttributeName: UIColor(red: 73/255, green:  75/255, blue: 77/255, alpha: 1)]
        
        nav?.barTintColor = UIColor.whiteColor()
        nav?.tintColor = UIColor(red: 73/255, green:  75/255, blue: 77/255, alpha: 1)
        

        // __________________________________________________________________________
        
        var gesture1: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed1:")
        var gesture2: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed2:")
        var gesture3: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed3:")
        var gesture4: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed4:")
        var gesture5: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed5:")
        var gesture6: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed6:")
        var gesture7: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed7:")
        var gesture8: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed8:")
        var gesture9: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed9:")
        
        let abc: () = gesture1.minimumPressDuration = 2.0
        gesture2.minimumPressDuration = 2.0
        gesture3.minimumPressDuration = 2.0
        gesture4.minimumPressDuration = 2.0
        gesture5.minimumPressDuration = 2.0
        gesture6.minimumPressDuration = 2.0
        gesture7.minimumPressDuration = 2.0
        gesture8.minimumPressDuration = 2.0
        gesture9.minimumPressDuration = 2.0
        
        self.button1.addGestureRecognizer(gesture1)
        self.button2.addGestureRecognizer(gesture2)
        self.button3.addGestureRecognizer(gesture3)
        self.button4.addGestureRecognizer(gesture4)
        self.button5.addGestureRecognizer(gesture5)
        self.button6.addGestureRecognizer(gesture6)
        self.button7.addGestureRecognizer(gesture7)
        self.button8.addGestureRecognizer(gesture8)
        self.button9.addGestureRecognizer(gesture9)
        
        
        /*
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed:")
        self.view.addGestureRecognizer(longPressRecognizer)
        */
        
    }
    
    /*
    func longPressed (sender: UIGestureRecognizer) {
        println("here")
        println(sender.view)
    }
    */

    // __________________________________________________________________________
    
    func longPressed1(longPress: UIGestureRecognizer){
        if(longPress.state == UIGestureRecognizerState.Began){
            button10.enabled = true;
            if filled[0] == 1 {
                self.performSegueWithIdentifier("popOver1", sender: self)
            }
            else if filled[0] == 0 {
                println("denied: empty block")
            }
        }
    }
    
    func longPressed2(longPress: UIGestureRecognizer){
        if(longPress.state == UIGestureRecognizerState.Began){
            button10.enabled = true;
            if filled[0] == 1 {
                self.performSegueWithIdentifier("popOver2", sender: self)
            }
            else if filled[0] == 0 {
                println("denied: empty block")
            }
        }
    }
    
    func longPressed3(longPress: UIGestureRecognizer){
        if(longPress.state == UIGestureRecognizerState.Began){
            button10.enabled = true;
            if filled[0] == 1 {
                self.performSegueWithIdentifier("popOver3", sender: self)
            }
            else if filled[0] == 0 {
                println("denied: empty block")
            }
        }
    }
    
    func longPressed4(longPress: UIGestureRecognizer){
        if(longPress.state == UIGestureRecognizerState.Began){
            button10.enabled = true;
            if filled[0] == 1 {
                self.performSegueWithIdentifier("popOver4", sender: self)
            }
            else if filled[0] == 0 {
                println("denied: empty block")
            }
        }
    }
    
    func longPressed5(longPress: UIGestureRecognizer){
        if(longPress.state == UIGestureRecognizerState.Began){
            button10.enabled = true;
            if filled[0] == 1 {
                self.performSegueWithIdentifier("popOver5", sender: self)
            }
            else if filled[0] == 0 {
                println("denied: empty block")
            }
        }
    }
    
    func longPressed6(longPress: UIGestureRecognizer){
        if(longPress.state == UIGestureRecognizerState.Began){
            button10.enabled = true;
            if filled[0] == 1 {
                self.performSegueWithIdentifier("popOver6", sender: self)
            }
            else if filled[0] == 0 {
                println("denied: empty block")
            }
        }
    }
    
    func longPressed7(longPress: UIGestureRecognizer){
        if(longPress.state == UIGestureRecognizerState.Began){
            button10.enabled = true;
            if filled[0] == 1 {
                self.performSegueWithIdentifier("popOver7", sender: self)
            }
            else if filled[0] == 0 {
                println("denied: empty block")
            }
        }
    }
    
    func longPressed8(longPress: UIGestureRecognizer){
        if(longPress.state == UIGestureRecognizerState.Began){
            button10.enabled = true;
            if filled[0] == 1 {
                self.performSegueWithIdentifier("popOver8", sender: self)
            }
            else if filled[0] == 0 {
                println("denied: empty block")
            }
        }
    }
    
    func longPressed9(longPress: UIGestureRecognizer){
        if(longPress.state == UIGestureRecognizerState.Began){
            button10.enabled = true;
            if filled[0] == 1 {
                self.performSegueWithIdentifier("popOver9", sender: self)
            }
            else if filled[0] == 0 {
                println("denied: empty block")
            }
        }
    }
    
    
    
    
    // __________________________________________________________________________
    // -- all for popup, otherwise fullpage modal
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    // __________________________________________________________________________
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if identifier == "popOver1" {
            if filled[0] == 0 {
                let alert = UIAlertView()
                alert.title = "No Recording Found"
                alert.message = "Prease Record A Sound"
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
            return false
        }
        
        if identifier == "popOver2" {
            if filled[0] == 0 {
                let alert = UIAlertView()
                alert.title = "No Recording Found"
                alert.message = "Prease Record A Sound"
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
            return false
        }
        
        if identifier == "popOver3" {
            if filled[0] == 0 {
                let alert = UIAlertView()
                alert.title = "No Recording Found"
                alert.message = "Prease Record A Sound"
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
            return false
        }
        
        if identifier == "popOver4" {
            if filled[0] == 0 {
                let alert = UIAlertView()
                alert.title = "No Recording Found"
                alert.message = "Prease Record A Sound"
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
            return false
        }
            
        if identifier == "popOver5" {
            if filled[0] == 0 {
                let alert = UIAlertView()
                alert.title = "No Recording Found"
                alert.message = "Prease Record A Sound"
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
            return false
        }
            
        if identifier == "popOver6" {
            if filled[0] == 0 {
                let alert = UIAlertView()
                alert.title = "No Recording Found"
                alert.message = "Prease Record A Sound"
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
            return false
        }
            
        if identifier == "popOver7" {
            if filled[0] == 0 {
                let alert = UIAlertView()
                alert.title = "No Recording Found"
                alert.message = "Prease Record A Sound"
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
            return false
        }
            
        if identifier == "popOver8" {
            if filled[0] == 0 {
                let alert = UIAlertView()
                alert.title = "No Recording Found"
                alert.message = "Prease Record A Sound"
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
            return false
        }
            
        if identifier == "popOver9" {
            if filled[0] == 0 {
                let alert = UIAlertView()
                alert.title = "No Recording Found"
                alert.message = "Prease Record A Sound"
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
            return false
        }
            
        else {
            return true
        }
    }
    
    
    // __________________________________________________________________________
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "popOver1" {
            println("prepareForSegue here")
            let popoverViewController = segue.destinationViewController as! UIViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
        if segue.identifier == "popOver2"{
            println("here track2")
            let popoverViewController = segue.destinationViewController as! UIViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
        if segue.identifier == "popOver3"{
            println("here track2")
            let popoverViewController = segue.destinationViewController as! UIViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
        if segue.identifier == "popOver4" {
            println("prepareForSegue here")
            let popoverViewController = segue.destinationViewController as! UIViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
        if segue.identifier == "popOver5"{
            println("here track2")
            let popoverViewController = segue.destinationViewController as! UIViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
        if segue.identifier == "popOver6"{
            println("here track2")
            let popoverViewController = segue.destinationViewController as! UIViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
        if segue.identifier == "popOver7"{
            println("here track2")
            let popoverViewController = segue.destinationViewController as! UIViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
        if segue.identifier == "popOver8"{
            println("here track2")
            let popoverViewController = segue.destinationViewController as! UIViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
        if segue.identifier == "popOver9"{
            println("here track2")
            let popoverViewController = segue.destinationViewController as! UIViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
    }
    // __________________________________________________________________________
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttons(sender: UIButton) {
        if sender.tag == 1{
            if filled[0] == 1 {
                if on[0] == 0 {
                    var url: NSURL?
                    var error: NSError?
                    let audioSession = AVAudioSession.sharedInstance()
                    audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord,
                        error: &error)
                    audioPlayer = AVAudioPlayer(contentsOfURL: url1,
                        error: &error)
                    session.overrideOutputAudioPort(AVAudioSessionPortOverride.Speaker, error: nil)
                    audioPlayer?.enableRate = true
                    audioPlayer?.numberOfLoops = -1
                    audioPlayer?.delegate = self
                    audioPlayer?.volume = audiolevels[0]
                    audioPlayer?.rate = ratelevel[0]
                    println(audioPlayer?.volume)
                    
                    if let err = error {
                        println("audioPlayer error: \(err.localizedDescription)")
                    } else {
                        println("smokeey")
                        audioPlayer?.play()
                    }

                    sender.layer.borderWidth = 2
                    sender.layer.borderColor = UIColor.whiteColor().CGColor
                    on[0] = 1;
                }
                else if on[0] == 1{
                    audioPlayer?.stop()
//                    sender.layer.borderColor = UIColor.grayColor().CGColor
                    on[0] = 0;
                }
            }
        }
        
        if sender.tag == 2{
            if filled[2] == 1 {
                if on[1] == 0 {
                    var url: NSURL?
                    
                    var error: NSError?
                    let audioSession = AVAudioSession.sharedInstance()
                    audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord,
                        error: &error)
                    
                    audioPlayer2 = AVAudioPlayer(contentsOfURL: url2,
                        error: &error)
                    session.overrideOutputAudioPort(AVAudioSessionPortOverride.Speaker, error: nil)
                    
                    audioPlayer2?.numberOfLoops = -1
                    audioPlayer2?.delegate = self
                    
                    if let err = error {
                        println("audioPlayer error: \(err.localizedDescription)")
                    } else {
                        println("smokeey")
                        audioPlayer2?.play()
                    }
                    sender.layer.borderWidth = 2
                    sender.layer.borderColor = UIColor.whiteColor().CGColor
                    on[1] = 1;
                }
                else if on[1] == 1{
                    audioPlayer2?.stop()
//                    sender.layer.borderColor = UIColor.grayColor().CGColor
                    on[1] = 0
                }
            }
        }
        
        if sender.tag == 3{
            if filled[4] == 1 {
                if on[2] == 0 {
                    var url: NSURL?
                    
                    var error: NSError?
                    let audioSession = AVAudioSession.sharedInstance()
                    audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord,
                        error: &error)
                    
                    audioPlayer3 = AVAudioPlayer(contentsOfURL: url3,
                        error: &error)
                    session.overrideOutputAudioPort(AVAudioSessionPortOverride.Speaker, error: nil)
                    
                    audioPlayer3?.numberOfLoops = -1
                    audioPlayer3?.delegate = self
                    
                    if let err = error {
                        println("audioPlayer error: \(err.localizedDescription)")
                    } else {
                        println("smokeey")
                        audioPlayer3?.play()
                    }

                    sender.layer.borderWidth = 2
                    sender.layer.borderColor = UIColor.whiteColor().CGColor
                    on[2] = 1;
                }
                else if on[2] == 1{
                    audioPlayer3?.stop()
//                    sender.layer.borderColor = UIColor.grayColor().CGColor
                    on[2] = 0
                }
            }
        }
        
        if sender.tag == 4{
            if filled[6] == 1 {
                if on[3] == 0 {
                    var url: NSURL?
                    
                    var error: NSError?
                    let audioSession = AVAudioSession.sharedInstance()
                    audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord,
                        error: &error)
                    
                    audioPlayer4 = AVAudioPlayer(contentsOfURL: url4,
                        error: &error)
                    session.overrideOutputAudioPort(AVAudioSessionPortOverride.Speaker, error: nil)
                    
                    audioPlayer4?.numberOfLoops = -1
                    audioPlayer4?.delegate = self
                    
                    if let err = error {
                        println("audioPlayer error: \(err.localizedDescription)")
                    } else {
                        println("smokeey")
                        audioPlayer4?.play()
                    }

                    sender.layer.borderWidth = 2
                    sender.layer.borderColor = UIColor.whiteColor().CGColor
                    on[3] = 1;
                }
                else if on[3] == 1{
                    audioPlayer4?.stop()
//                    sender.layer.borderColor = UIColor.grayColor().CGColor
                    on[3] = 0
                }
            }
        }
        
        if sender.tag == 5{
            if filled[8] == 1 {
                if on[4] == 0 {
                    var url: NSURL?
                    
                    var error: NSError?
                    let audioSession = AVAudioSession.sharedInstance()
                    audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord,
                        error: &error)
                    
                    audioPlayer5 = AVAudioPlayer(contentsOfURL: url5,
                        error: &error)
                    session.overrideOutputAudioPort(AVAudioSessionPortOverride.Speaker, error: nil)
                    
                    audioPlayer5?.numberOfLoops = -1
                    audioPlayer5?.delegate = self
                    
                    if let err = error {
                        println("audioPlayer error: \(err.localizedDescription)")
                    } else {
                        println("smokeey")
                        audioPlayer5?.play()
                    }

                    sender.layer.borderWidth = 2
                    sender.layer.borderColor = UIColor.whiteColor().CGColor
                    on[4] = 1;
                }
                else if on[4] == 1{
                    audioPlayer5?.stop()
//                    sender.layer.borderColor = UIColor.grayColor().CGColor
                    on[4] = 0
                }
            }
        }

        if sender.tag == 6{
            if filled[10] == 1 {
                if on[5] == 0 {
                    var url: NSURL?
                    
                    var error: NSError?
                    let audioSession = AVAudioSession.sharedInstance()
                    audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord,
                        error: &error)
                    
                    audioPlayer6 = AVAudioPlayer(contentsOfURL: url6,
                        error: &error)
                    session.overrideOutputAudioPort(AVAudioSessionPortOverride.Speaker, error: nil)
                    
                    audioPlayer6?.numberOfLoops = -1
                    audioPlayer6?.delegate = self
                    
                    if let err = error {
                        println("audioPlayer error: \(err.localizedDescription)")
                    } else {
                        println("smokeey")
                        audioPlayer6?.play()
                    }

                    sender.layer.borderWidth = 2
                    sender.layer.borderColor = UIColor.whiteColor().CGColor
                    on[5] = 1;
                }
                else if on[5] == 1{
                    audioPlayer6?.stop()
//                    sender.layer.borderColor = UIColor.grayColor().CGColor
                    on[5] = 0
                }
            }
        }

        if sender.tag == 7{
            if filled[12] == 1 {
                if on[6] == 0 {
                    var url: NSURL?
                    
                    var error: NSError?
                    let audioSession = AVAudioSession.sharedInstance()
                    audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord,
                        error: &error)
                    
                    audioPlayer7 = AVAudioPlayer(contentsOfURL: url7,
                        error: &error)
                    session.overrideOutputAudioPort(AVAudioSessionPortOverride.Speaker, error: nil)
                    
                    audioPlayer7?.numberOfLoops = -1
                    audioPlayer7?.delegate = self
                    
                    if let err = error {
                        println("audioPlayer error: \(err.localizedDescription)")
                    } else {
                        println("smokeey")
                        audioPlayer7?.play()
                    }

                    sender.layer.borderWidth = 2
                    sender.layer.borderColor = UIColor.whiteColor().CGColor
                    on[6] = 1;
                }
                else if on[6] == 1{
                    audioPlayer7?.stop()
//                    sender.layer.borderColor = UIColor.grayColor().CGColor
                    on[6] = 0
                }
            }
        }

        if sender.tag == 8{
            if filled[14] == 1 {
                if on[7] == 0 {
                    var url: NSURL?
                    
                    var error: NSError?
                    let audioSession = AVAudioSession.sharedInstance()
                    audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord,
                        error: &error)
                    
                    audioPlayer8 = AVAudioPlayer(contentsOfURL: url8,
                        error: &error)
                    session.overrideOutputAudioPort(AVAudioSessionPortOverride.Speaker, error: nil)
                    
                    audioPlayer8?.numberOfLoops = -1
                    audioPlayer8?.delegate = self
                    
                    if let err = error {
                        println("audioPlayer error: \(err.localizedDescription)")
                    } else {
                        println("smokeey")
                        audioPlayer8?.play()
                    }

                    sender.layer.borderWidth = 2
                    sender.layer.borderColor = UIColor.whiteColor().CGColor
                    on[7] = 1;
                }
                else if on[7] == 1{
                    audioPlayer8?.stop()
//                    sender.layer.borderColor = UIColor.grayColor().CGColor
                    on[7] = 0
                }
            }
        }

        if sender.tag == 9{
            if filled[16] == 1 {
                if on[8] == 0 {
                    var url: NSURL?
                    
                    var error: NSError?
                    let audioSession = AVAudioSession.sharedInstance()
                    audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord,
                        error: &error)
                    
                    audioPlayer9 = AVAudioPlayer(contentsOfURL: url9,
                        error: &error)
                    session.overrideOutputAudioPort(AVAudioSessionPortOverride.Speaker, error: nil)
                    
                    audioPlayer9?.numberOfLoops = -1
                    audioPlayer9?.delegate = self
                    
                    if let err = error {
                        println("audioPlayer error: \(err.localizedDescription)")
                    } else {
                        println("smokeey")
                        audioPlayer9?.play()
                    }

                    sender.layer.borderWidth = 2
                    sender.layer.borderColor = UIColor.whiteColor().CGColor
                    on[8] = 1;
                }
                else if on[8] == 1{
                    audioPlayer9?.stop()
//                    sender.layer.borderColor = UIColor.grayColor().CGColor
                    on[8] = 0
                }
            }
        }
        
        if sender.tag == 10 {
            stop_play()
            
            //enter code for recording
            run()
            if counter >= 19{
                
            }
            else{
                on = [0,0,0,0,0,0,0,0,0]
                if counter % 2 == 0 {
                   audioRecorder?.record()
                   filled[counter] = 1
                }
                else if counter % 2 != 0{
                    audioRecorder?.stop()
                }
                counter++
            }
        }
        refresh()
    }
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    
    func stop_play(){
        audioPlayer?.stop()
        audioPlayer2?.stop()
        audioPlayer3?.stop()
        audioPlayer4?.stop()
        audioPlayer5?.stop()
        audioPlayer6?.stop()
        audioPlayer7?.stop()
        audioPlayer8?.stop()
        audioPlayer9?.stop()
    }
    
    func refresh (){
        if filled[0] == 1 {
            button1.backgroundColor = soundisthere
        }
        if filled[0] == 0 {
            button1.backgroundColor = grayed
        }
        if filled[2] == 1 {
            button2.backgroundColor = soundisthere
        }
        if filled[2] == 0 {
            button2.backgroundColor = grayed
        }
        if filled[4] == 1 {
            button3.backgroundColor = soundisthere
        }
        if filled[4] == 0 {
            button3.backgroundColor = grayed
        }
        if filled[6] == 1 {
            button4.backgroundColor = soundisthere
        }
        if filled[6] == 0 {
            button4.backgroundColor = grayed
        }
        if filled[8] == 1 {
            button5.backgroundColor = soundisthere
        }
        if filled[8] == 0 {
            button5.backgroundColor = grayed
        }
        if filled[10] == 1 {
            button6.backgroundColor = soundisthere
        }
        if filled[10] == 0 {
            button6.backgroundColor = grayed
        }
        if filled[12] == 1 {
            button7.backgroundColor = soundisthere
        }
        if filled[12] == 0 {
            button7.backgroundColor = grayed
        }
        if filled[14] == 1 {
            button8.backgroundColor = soundisthere
        }
        if filled[14] == 0 {
            button8.backgroundColor = grayed
        }
        if filled[16] == 1 {
            button9.backgroundColor = soundisthere
        }
        if filled[16] == 0 {
            button9.backgroundColor = grayed
        }
        
        if on[0] == 0 {
            button1.layer.borderWidth = 0
        }
        if on[1] == 0 {
            button2.layer.borderWidth = 0
        }
        if on[2] == 0 {
            button3.layer.borderWidth = 0
        }
        if on[3] == 0 {
            button4.layer.borderWidth = 0
        }
        if on[4] == 0 {
            button5.layer.borderWidth = 0
        }
        if on[5] == 0 {
            button6.layer.borderWidth = 0
        }
        if on[6] == 0 {
            button7.layer.borderWidth = 0
        }
        if on[7] == 0 {
            button8.layer.borderWidth = 0
        }
        if on[8] == 0 {
            button9.layer.borderWidth = 0
        }
        if counter % 2 != 0{
            button10.setTitle("STOP", forState: .Normal)
        }
        if counter % 2 == 0{
            button10.setTitle("RECORD", forState: .Normal)
        }
        
    }
}

