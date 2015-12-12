//
//  ViewController.swift
//  TicTacToe
//
//  Created by Mary Grace Lucas on 12/5/15.
//  Copyright © 2015 Mary Grace Lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // active player 1 = zero, active player 2 = x
    var activePlayer = 1
    
    
    // Describes what the board looks like
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    
    // Creates an array that defines all possible winning combinations
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]
    
        
    // Determines whether the game is finished. If yes, buttons will no longer work.
    var gameActive = true
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var button: UIButton!
    
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        
        // This if statement tests whether the button has been pressed. If it hasn't, the tag is 0 and the activePlayer is set to player #1. Once the button is pressed, activePlayer is then set to player #2.
        if (gameState[sender.tag] == 0 && gameActive == true) {
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
                
                sender.setImage(UIImage (named: "nought"), forState: .Normal)
                
                activePlayer = 2
                
            } else {
                
                sender.setImage(UIImage (named: "cross"), forState: .Normal)
                
                activePlayer = 1
                
                
            }
            
            // debug statemenet
            // print("board: \(gameState)")
            
            
            for combination in winningCombinations {
                
                
                //checks to see if all three items in a winningCombination array are the same and aren't empty
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]){
                    
                    gameActive = false
                    
                    if (gameState[combination[0]] == 1) {
                        
                        
                        resultLabel.text = "O wins!"
                        
                        print("O wins!")
                        
                    } else {
                        
                        resultLabel.text = "X wins!"
                        
                        print("X wins!")
                    }
                    
                    // This unhides the label and animates it in
                    
                    resultLabel.hidden = false;
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        
                        self.resultLabel.center = CGPointMake(self.resultLabel.center.x + 500, self.resultLabel.center.y)
                        
                    })
                }
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resultLabel.hidden = true
        
        resultLabel.center = CGPointMake(resultLabel.center.x - 500, resultLabel.center.y)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

