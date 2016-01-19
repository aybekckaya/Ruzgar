//
//  GameCreateVC.swift
//  Ruzgar
//
//  Created by aybek can kaya on 19/01/16.
//  Copyright © 2016 aybek can kaya. All rights reserved.
//

import Foundation
import UIKit

class GameCreateVC: UIViewController {

    static var blockSize:Int?
    
    
    @IBOutlet weak var viewGame: GameView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Lifecycle
        setUpGUI()
    }
    
    
    
    func setUpGUI()
    {
        let imageBG  = UIImage(named: "mazePattern.png")
        self.view.backgroundColor = UIColor(patternImage: imageBG!)
        
        
        let bounds = UIScreen.mainScreen().bounds
        let sizeBlockFL:Float = Float(Float(bounds.size.height) * Float(BLOCK_DIMENSION_320) / 320)
        
        GameCreateVC.blockSize = Int(sizeBlockFL)
        
        let widthView:CGFloat = CGFloat(GameCreateVC.blockSize!*20)
        let heightView:CGFloat = CGFloat(GameCreateVC.blockSize!*12)
        
        self.viewGame.frame = CGRectMake(0, 0, widthView, heightView)
         self.viewGame.center = CGPointMake(self.view.center.x , self.view.center.y)
        
        
        // left block view 
        
        let leftBGView:UIView = UIView(frame: CGRectMake(0,0,self.viewGame.frame.origin.x , self.view.frame.size.height))
        
        leftBGView.backgroundColor = UIColor.blackColor()
        self.view.addSubview(leftBGView)
        
        
        //
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}


/*
   Extension
*/

/*
extension GameCreateVC
{
    func setUpGUI()
    {
        let imageBG  = UIImage(named: "mazePattern.png")
        self.view.backgroundColor = UIColor(patternImage: imageBG!)
        
        
          let bounds = UIScreen.mainScreen().bounds
        let sizeBlockFL:Float = Float(Float(bounds.size.height) * Float(BLOCK_DIMENSION_320) / 320)
        
        GameCreateVC.blockSize = Int(sizeBlockFL)
        
        let widthView:CGFloat = CGFloat(GameCreateVC.blockSize!*20)
        let heightView:CGFloat = CGFloat(GameCreateVC.blockSize!*12)
        
        self.viewGame.frame = CGRectMake(0, 0, widthView, heightView)
       // self.viewGame.center = CGPointMake(self.view.center.x , 0)
        
        self.viewGame.frame = CGRectMake(0, 0, 10, 10)
        
        
    }
    
    
    
    
    
}
*/


