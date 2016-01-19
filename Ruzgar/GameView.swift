//
//  GameView.swift
//  Ruzgar
//
//  Created by aybek can kaya on 19/01/16.
//  Copyright © 2016 aybek can kaya. All rights reserved.
//

import Foundation
import UIKit



class GameView: UIView {

    let numBlocksHorizontal = 20
    let numBlocksVertical = 12
    
    let intVal:Int = 0
    
    var mazeArr: NSArray?{
        didSet{
            createMaze()
        }
    }
    
    override func awakeFromNib()
    {
            super.awakeFromNib()
        
           // bg Image Default Pattern 
        let bgImage = UIImage(named: "backgroundPattern.png")
        self.backgroundColor = UIColor(patternImage: bgImage!)
        
    }
    
    
    private func createMaze()
    {
        
    }
    
    
    
}
