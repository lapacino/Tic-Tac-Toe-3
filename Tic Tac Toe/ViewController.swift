//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by lapacino on 8/12/15.
//  Copyright (c) 2015 lapacino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    
    
    var goNumber = 0
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winPossiblity = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var winner = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func playAgainButton(sender: UIButton) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        winner = 0
        
        for var i = 0; i < 9; i++ {
           
            var button = self.view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
        }
        playAgain.hidden = true
        resultLabel.hidden = true
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func buttonPressed(sender: UIButton) {
        
        if gameState[sender.tag] == 0  && winner == 0{
            var image = UIImage()
            if goNumber % 2 == 0 {
                image = UIImage(named: "cross.png")!
                gameState[sender.tag] = 1
                
            }
            else {
                image = UIImage(named: "nought.png")!
                gameState[sender.tag] = 2
            }
            
            sender.setImage(image, forState: .Normal)
            goNumber++
            checkForWin()
            println(goNumber)
        }
        if !contains(gameState, 0) && winner == 0 {
            resultLabel.hidden = false
            playAgain.hidden = false
            resultLabel.text = "it look like a tie"
        }
        
        
    }

    
    func checkForWin() {
        for win in winPossiblity {
            
            if gameState[win[0]]  == gameState[win[1]]  && gameState[win[0]] == gameState[win[2]] && gameState[win[0]] != 0 {
               
                winner = gameState[win[0]]
                
                if winner == 1 {
                    resultLabel.hidden = false
                    playAgain.hidden = false
                    resultLabel.text = "cross Won"
                }
                else{
                    resultLabel.hidden = false
                    playAgain.hidden = false
                    resultLabel.text = "nought Won"
                }
            }
        }
    }

}

