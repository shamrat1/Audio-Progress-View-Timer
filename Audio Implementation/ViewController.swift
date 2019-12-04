//
//  ViewController.swift
//  Audio Implementation
//
//  Created by Leads Computer on 12/3/19.
//  Copyright © 2019 Leads Computer. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var progrssBar: UIProgressView!
    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var btnOutlet: UIButton!
    
    
    
    
    
    var completeSound: AVAudioPlayer?
    var time = 0.0
    var isRunning = false
    var isRed = false
    var progressBarTimer: Timer!
    var currentTime = Timer()
    var seconds = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        currentTime = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(updateLabel) , userInfo: nil, repeats: true)
       
        progrssBar.progress = 0.0
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? NextViewController {
            vc.seconds = seconds
        }
    }
    @IBAction func startBtn(_ sender: Any) {
        
        
        if(isRunning){
            currentTime.invalidate()
            seconds = 10
            clockLabel.text = "Clock view"
            progressBarTimer.invalidate()
            btnOutlet.setTitle("Start", for: .normal)
        }
        else{
        currentTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
            
        btnOutlet.setTitle("Stop", for: .normal)
        progrssBar.progress = 0.0
            self.progressBarTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateProgressView), userInfo: nil, repeats: true)
        if(isRed){
            progrssBar.progressTintColor = UIColor.blue
            progrssBar.progressViewStyle = .default
        }
        else{
            progrssBar.progressTintColor = UIColor.red
            progrssBar.progressViewStyle = .bar
            
        }
        isRed = !isRed
        }
        isRunning = !isRunning
    }
    @objc func counter(){
        seconds -= 1
        clockLabel.text = String(seconds)
        
        if seconds == 0 {
            seconds = 10
            currentTime.invalidate()
            clockLabel.text = "Clock view"
        }
    }
//    @objc func updateLabel(){
//        clockLabel.text = DateFormatter.localizedString(from: Date(),
//        dateStyle: .none,
//        timeStyle: .medium)
//    }
    
    @objc func updateProgressView(){
        progrssBar.progress += 0.1
        progrssBar.setProgress(progrssBar.progress, animated: true)
        if(progrssBar.progress == 1.0)
        {
            progressBarTimer.invalidate()
            isRunning = false
            btnOutlet.setTitle("Start", for: .normal)
        }
        if progrssBar.progress == 1.0 {
            let path = Bundle.main.path(forResource: "complete.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                completeSound = try AVAudioPlayer(contentsOf: url)
                completeSound?.play()
            } catch {
                // couldn't load file :(
            }
        }
    }

}

