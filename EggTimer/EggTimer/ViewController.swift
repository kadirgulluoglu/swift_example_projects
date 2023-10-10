//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft": 5, "Medium": 10 , "Hard":15 ]
    var timer: Timer?
    var secondsRemaining = 60
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        let hardness = sender.currentTitle!
        let result = eggTimes[hardness]!
        
        
        
        if let existingTimer = timer {
            existingTimer.invalidate()
        }
        startCountDown(seconds:result)
        
        
    }
    func startCountDown(seconds: Int?){
        titleLabel.text = "Your eggs are being prepared"
        var secondsRemaining = seconds
        progressBar.progress = 0.0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            if secondsRemaining! > 1 {
                secondsRemaining! -= 1
                let progressPercentage = Float((seconds ?? 1) - (secondsRemaining ?? 0)) / Float(seconds ?? 1)
                self.progressBar.progress = progressPercentage
                
            } else {
                self.playSound()
                self.progressBar.progress = 1.0
                self.titleLabel.text = "DONE"
                self.timer!.invalidate()
                
            }
        }
    }
    
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
}
