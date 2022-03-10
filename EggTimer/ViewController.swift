//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var countdownTarget: Int = 0
    var currentTime: Int = 0
    var timer: Timer? = nil
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func eggButtonPressed(_ sender: UIButton) {
        let timerTime = sender.tag * 60
        countdownTarget = timerTime
        currentTime = timerTime
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        
        titleLabel.text = "How do you like your eggs?"
        timer = Timer.scheduledTimer(
            timeInterval: 0.01, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        
        progressView.setProgress(0.0, animated: false)
    }
    
    @objc func onTimerFires(_ timer: Timer)
    {
        progressView.setProgress(Float(countdownTarget - currentTime) / Float(countdownTarget), animated: true)
        
        currentTime -= 1
        if currentTime <= 0 {
            timer.invalidate()
            titleLabel.text = "Done!"
            progressView.progress = 1.0
        }
        print ("\(currentTime) seconds left")
    }
}
