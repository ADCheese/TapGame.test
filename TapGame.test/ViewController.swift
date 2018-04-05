//
//  ViewController.swift
//  TapGame.test
//
//  Created by Jansen Rondael on 1/29/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var playerlabel2: UILabel!
    @IBOutlet weak var playerlabel: UILabel!
    @IBOutlet weak var playerscore1: UILabel!
    @IBOutlet weak var playerscore2: UILabel!
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    var score1: Int = 0 {
        didSet {
            
            playerscore1.text = "\(score1)"
        }
    }
    var score2: Int = 0 {
        didSet {
            
            playerscore2.text = "\(score2)"
        }
    
}
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == text1 {
        playerlabel.text = text1.text
             self.text1.alpha = 0
            self.player.play()
            return true
        }else{
            playerlabel2.text = text2.text
            self.text2.alpha = 0
            
            
        }
        return true
        
    
}
    override func viewDidLoad() {
        super.viewDidLoad()
        playerlabel.text = "Enter Player Name Bellow"
        playerlabel2.text = "Enter Player Name Bellow"
        
        do
        {
            let audioPath = Bundle.main.path(forResource: "startheme", ofType: "mp3")
            try player = AVAudioPlayer (contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
            
        {
            //ERROR
        }
        
    }
    @IBAction func Mario(_ sender: UIButton) {
        score1 += 1
        if playerscore1.text == "25" {
            playerscore1.text = "\(text2.text!) Wins!"
            
            let alert = UIAlertController(title: "A Winner Has Been Decided", message:"\(text2.text!)", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Play Again?", style: .default, handler: { (action) in
                
                self.score1 = 0
                self.score2 = 0
                self.playerscore1.text = ""
                self.playerscore2.text = ""
                self.playerlabel2.text = ""
                self.playerlabel.text = ""
                self.playerlabel.text = "Enter Player Name Bellow"
                self.playerlabel2.text = "Enter Player Name Bellow"
                self.text1.alpha = 1
                self.text2.alpha = 1
                self.player.stop()
                
            }))
            self.present(alert,animated: true, completion: nil)
            
        }
    }
    
    @IBAction func Luigi(_ sender: UIButton) {
        score2 += 1
        if playerscore2.text == "25" {
            playerscore2.text = "\(text1.text!) Wins!"
            
            let alert = UIAlertController(title: "A Winner Has Been Decided", message:"\(text1.text!)", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Play Again?", style: .default, handler: { (action) in
                
                self.score1 = 0
                self.score2 = 0
                self.playerscore1.text = ""
                self.playerscore2.text = ""
                self.playerlabel2.text = ""
                self.playerlabel.text = ""
                self.playerlabel.text = "Enter Player Name Bellow"
                self.playerlabel2.text = "Enter Player Name Bellow"
                self.text1.alpha = 1
                self.text2.alpha = 1
                self.player.stop()
                
            }))
            self.present(alert,animated: true, completion: nil)
        }
    }
}
