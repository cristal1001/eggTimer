//
//  ViewController.swift
//  MyEggTimer
//
//  Created by Cristal Blanco on 27/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var secondsName: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 7]
    var timer = Timer()
    var secondsPassed = 0
    var totalTimer = 0
    
    
    @IBAction func HardnessSelector(_ sender: UIButton) {
        
        secondsName.numberOfLines = 0
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTimer = eggTimes[hardness]!
        
        titleLabel.text = hardness
        secondsPassed = 0
        progressView.progress = 0.0
        secondsName.text = "0"
        progressView.progressTintColor = UIColor(named: hardness)
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerPassed), userInfo: nil, repeats: true)
   
    }
    @objc func timerPassed() {
        if secondsPassed < totalTimer{
            secondsPassed += 1
            secondsName.text = "\(secondsPassed) seconds"
            progressView.progress = Float(secondsPassed) / Float(totalTimer)
            
        }else{
            timer.invalidate()
            titleLabel.text = "DONE!"
            secondsName.text = "COMPLETED!"
        }
        
    }
}


