//
//  PlaySoundViewController.swift
//  PitchPerfect
//
//  Created by Weijie Wang on 2016-08-12.
//  Copyright © 2016 Weijie Wang. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType: Int { case Slow = 0, Fast, Chipmunk, Vadar, Echo, Reverse }
    
    @IBAction func playSoundForButton(sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case ButtonType.Slow:
            playSound(rate: 0.5)
        case ButtonType.Fast:
            playSound(rate: 1.5)
        case ButtonType.Chipmunk:
            playSound(pitch: 1000)
        case ButtonType.Vadar:
            playSound(pitch: -1000)
        case ButtonType.Echo:
            playSound(echo: true)
        case ButtonType.Reverse:
            playSound(reverb: true)
        }
        
        configureUI(PlayingState.Playing)
    }
    
    @IBAction func stopButtonPress(sender: AnyObject) {
        stopAudio()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
  
        setupAudio()
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(PlayingState.NotPlaying)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
