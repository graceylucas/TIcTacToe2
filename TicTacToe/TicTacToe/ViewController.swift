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
    
    
    @IBOutlet weak var button: UIButton!
    
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        
        if activePlayer == 1 {
            
            sender.setImage(UIImage (named: "nought"), forState: .Normal)
            
            
            activePlayer = 2
            
        }
            
        else {
            
            sender.setImage(UIImage (named: "cross"), forState: .Normal)
          
            
            activePlayer = 1
            
            
            
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

