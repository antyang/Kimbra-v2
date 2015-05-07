//
//  ViewController.swift
//  Kimbra
//
//  Created by Arthur Bello on 5/6/15.
//  Copyright (c) 2015 Arthur Bello. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    var count: Int = 1
    
    var session = AVAudioSession.sharedInstance()
    var startstop1 = true
    var startstop2 = true
    var startstop3 = true
    var startstop4 = true
    var startstop5 = true
    var startstop6 = true
    var startstop7 = true
    var startstop8 = true
    var startstop9 = true
    var url1: NSURL?
    var url2: NSURL?
    var url3: NSURL?
    var url4: NSURL?
    var url5: NSURL?
    var url6: NSURL?
    var url7: NSURL?
    var url8: NSURL?
    var url9: NSURL?
    var audioPlayer: AVAudioPlayer?
    var audioPlayer2: AVAudioPlayer?
    var audioPlayer3: AVAudioPlayer?
    var audioPlayer4: AVAudioPlayer?
    var audioPlayer5: AVAudioPlayer?
    var audioPlayer6: AVAudioPlayer?
    var audioPlayer7: AVAudioPlayer?
    var audioPlayer8: AVAudioPlayer?
    var audioPlayer9: AVAudioPlayer?
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
        docsDir.stringByAppendingPathComponent("sound\(count).caf")
        println(soundFilePath)
        
        
        var soundFileURL = NSURL(fileURLWithPath: soundFilePath)
        if count == 1 {
            url1 = soundFileURL
        }
        if count == 2 {
            url2 = soundFileURL
        }
        if count == 3 {
            url3 = soundFileURL
        }
        if count == 4 {
            url4 = soundFileURL
        }
        if count == 5 {
            url5 = soundFileURL
        }
        if count == 6 {
            url6 = soundFileURL
        }
        if count == 7 {
            url7 = soundFileURL
        }
        if count == 8 {
            url8 = soundFileURL
        }
        if count == 9 {
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
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var record_button: UIButton!
    @IBAction func record(sender: AnyObject) {
        run()
        if audioRecorder?.recording == false {
            count++
            audioRecorder?.record()
        }
        self.record_button.fadeOut(completion: {
            (finished: Bool) -> Void in
            self.stop.hidden = false
            self.stop.fadeIn()
        })
    }
    @IBAction func pusher(sender: AnyObject) {
        if audioRecorder?.recording == true {
            audioRecorder?.stop()
        } else {
            
        }

        if row < 4 {
        column++
            if column == 9 {
            record_button.enabled = false
            }
        if column % 3 == 1 {
            index = CGFloat(40)
        }
        else if column % 3 == 2{
            index = CGFloat(150)
        }
        else {
            index = CGFloat(260)

        }
        let dunamicButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            func getRandomColor() -> UIColor{
                
                var randomRed:CGFloat = CGFloat(drand48())
                
                var randomGreen:CGFloat = CGFloat(drand48())
                
                var randomBlue:CGFloat = CGFloat(drand48())
                
                return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
                
            }
        dunamicButton.backgroundColor = getRandomColor()
        dunamicButton.setTitle("Voice \(column)", forState: UIControlState.Normal)
        dunamicButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        dunamicButton.tag = Int(column)
            dunamicButton.layer.borderWidth = 2.0
        dunamicButton.layer.borderColor = UIColor.whiteColor().CGColor
        dunamicButton.layer.cornerRadius = 10.0
        println(dunamicButton.tag)
        dunamicButton.frame = CGRectMake(index, CGFloat(row*110), 100, 100)
        dunamicButton.addTarget(self, action: "playAudio:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(dunamicButton)
        if column % 3 == 0 {
        row++
            
        }
            self.stop.fadeOut(completion: {
                (finished: Bool) -> Void in
                self.record_button.fadeIn()
                
            })
        }
    }
    func playAudio(sender:UIButton!)
    {
        if sender.tag == 1 {
            println(sender.tag)
            if audioRecorder?.recording == false {
                println(startstop1)
                if startstop1 == true {
                    var url: NSURL?
                    
                    var error: NSError?
                    let audioSession = AVAudioSession.sharedInstance()
                    audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord,
                        error: &error)
                    
                    audioPlayer = AVAudioPlayer(contentsOfURL: url1,
                        error: &error)
                    session.overrideOutputAudioPort(AVAudioSessionPortOverride.Speaker, error: nil)

                    audioPlayer?.numberOfLoops = -1
                    audioPlayer?.delegate = self
                    
                    if let err = error {
                        println("audioPlayer error: \(err.localizedDescription)")
                    } else {
                        println("smokeey")
                        audioPlayer?.play()
                        startstop1 = false
                    }
                } else {
                    audioPlayer?.stop()
                    startstop1 = true
                    
                }
            }

        }
        else if sender.tag == 2 {
            if audioRecorder?.recording == false {
                
                if startstop2 == true {
                    
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
                        audioPlayer2?.play()
                        startstop2 = false
                    }
                } else {
                    audioPlayer2?.stop()
                    startstop2 = true
                    
                }
            }

        }
        else if sender.tag == 3 {
            if audioRecorder?.recording == false {
                
                if startstop3 == true {
                    
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
                        audioPlayer3?.play()
                        startstop3 = false
                    }
                } else {
                    audioPlayer3?.stop()
                    startstop3 = true
                    
                }
            }

        }
        
        else if sender.tag == 4 {
            if audioRecorder?.recording == false {
                
                if startstop4 == true {
                    
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
                        audioPlayer4?.play()
                        startstop4 = false
                    }
                } else {
                    audioPlayer4?.stop()
                    startstop4 = true
                    
                }
            }

        }
        
        else if sender.tag == 5 {
            if audioRecorder?.recording == false {
                
                if startstop5 == true {
                    
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
                        audioPlayer5?.play()
                        startstop5 = false
                    }
                } else {
                    audioPlayer5?.stop()
                    startstop5 = true
                    
                }
            }
        }
        
        else if sender.tag == 6 {
            if audioRecorder?.recording == false {
                
                if startstop6 == true {
                    
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
                        audioPlayer6?.play()
                        startstop6 = false
                    }
                } else {
                    audioPlayer6?.stop()
                    startstop6 = true
                    
                }
            }

        }
        
        else if sender.tag == 7 {
            if audioRecorder?.recording == false {
                
                if startstop7 == true {
                    
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
                        audioPlayer7?.play()
                        startstop7 = false
                    }
                } else {
                    audioPlayer7?.stop()
                    startstop7 = true
                    
                }
            }

        }
        
        else if sender.tag == 8 {
            if audioRecorder?.recording == false {
                
                if startstop8 == true {
                    
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
                        audioPlayer8?.play()
                        startstop8 = false
                    }
                } else {
                    audioPlayer8?.stop()
                    startstop8 = true
                    
                }
            }

        }
        else if sender.tag == 9 {
            if audioRecorder?.recording == false {
                
                if startstop9 == true {
                    
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
                        audioPlayer9?.play()
                        startstop9 = false
                    }
                } else {
                    audioPlayer9?.stop()
                    startstop9 = true
                    
                }
            }
        }
    }
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        record_button.enabled = true
        stop.enabled = true
    }
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer!, error: NSError!) {
        println("Audio Play Decode Error")
    }
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
    }
    
    func audioRecorderEncodeErrorDidOccur(recorder: AVAudioRecorder!, error: NSError!) {
        println("Audio Record Encode Error")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        stop.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

