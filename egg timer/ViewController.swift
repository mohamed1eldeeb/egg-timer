//
//  ViewController.swift
//  egg timer
//
//  Created by Mohamed AbdElhakam on 16/05/2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimer = ["soft": 9 , "medium": 12 , "hard": 15]
    var totalTime = 0
    var secondTimer = 0
    var timer = Timer()
    var player : AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func kindEggBtn(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimer[hardness]!
        progressBar.progress = 0.0
        secondTimer = 0
        titleLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(updateTime) , userInfo: nil, repeats: true)
        
        
    }
    @objc func updateTime() {
        if secondTimer < totalTime{
            secondTimer += 1
            progressBar.progress = Float(secondTimer) / Float(totalTime)
            print(Float(secondTimer) / Float(totalTime))
            
        }else{
            timer.invalidate()
            titleLabel.text = "Done"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    

}











