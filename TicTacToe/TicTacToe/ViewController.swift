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
    
    
    // Determines whether the game is finished. If true, buttons will no longer work.
    var gameActive = true
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    // Resets the gameState, starts with Player #1, hides the results label and play again button, and sets all the senderbutton images back to empty
    @IBAction func playAgainButtonPressed(sender: UIButton) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        activePlayer = 1
        
        gameActive = true
        
        resultLabel.hidden = true
        
        self.playAgainButton.alpha = 0
        
        resultLabel.center = CGPointMake(resultLabel.center.x - 500, resultLabel.center.y)
        
        
        // Sets all buttons tag back to 0
        var buttonToClear : UIButton
        
        for var i = 0; i < 9; i++ {
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            
            buttonToClear.setImage(nil, forState: .Normal)
        }
        
    }
    
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
                    
                    endGame()
                    
                } // End of if statement with X wins or O wins conditions
                
            } // End of for combination loop
            
            
            // Checks to see if game is still active
            
            if gameActive == true {
                
                gameActive = false
                
                for buttonState in gameState {
                    
                    if buttonState == 0 {
                        
                        gameActive = true
                        
                    }
                    
                }
                
                if gameActive == false {
                    
                    resultLabel.text = "Draw :/"
                    
                    endGame()
                    
                }
                
            }
            
        }
        
    }
    
    // This declares the game over when X wins, O wins, or it's a draw, unhiding the label and animating it in
    
    func endGame() {
        
        resultLabel.hidden = false
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.resultLabel.center = CGPointMake(self.resultLabel.center.x + 500, self.resultLabel.center.y)
            
            }, completion: { (success) -> Void in
                
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    
                    self.playAgainButton.alpha = 1
                    
                })
                
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Sets result labels as hidden and off to the left
        
        resultLabel.hidden = true
        
        self.playAgainButton.alpha = 0
        
        resultLabel.center = CGPointMake(resultLabel.center.x - 500, resultLabel.center.y)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

