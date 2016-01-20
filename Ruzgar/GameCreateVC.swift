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
     var elements = [UIImageView]()
    
    var locationArr:NSMutableArray = []
    
    
    @IBOutlet weak var btnOK: UIButton!
    @IBOutlet weak var viewGame: GameView!
    
    @IBAction func btnOKOnTap(sender: AnyObject)
    {
        // save everything
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Lifecycle
        setUpGUI()
    }
    
    
    
    func setUpGUI()
    {
 /// Set up location array 
        
        locationArr = NSMutableArray()
        
        for  h in 0...ELEM_NUM_HEIGHT-1
        {
            for w in 0...ELEM_NUM_WIDTH-1
            {
                locationArr.addObject((0))
            }
        }
        
        
        
        
        
        
        let imageBG  = UIImage(named: "mazePattern.png")
        self.view.backgroundColor = UIColor(patternImage: imageBG!)
        
        
        let bounds = UIScreen.mainScreen().bounds
        let sizeBlockFL:Float = Float(Float(bounds.size.height) * Float(BLOCK_DIMENSION_320) / 320)
        
        GameCreateVC.blockSize = Int(sizeBlockFL)
        
        
        
        let widthView:CGFloat = CGFloat(GameCreateVC.blockSize!*ELEM_NUM_WIDTH)
        let heightView:CGFloat = CGFloat(GameCreateVC.blockSize!*ELEM_NUM_HEIGHT)
        
        self.viewGame.frame = CGRectMake(0, 0, widthView, heightView)
         self.viewGame.center = CGPointMake(self.view.center.x , self.view.center.y)
        
        
        // left block view 
        
        let leftBGView:UIView = UIView(frame: CGRectMake(0,0,self.viewGame.frame.origin.x-4 , self.view.frame.size.height))
        
        leftBGView.backgroundColor = UIColor.blackColor()
        self.view.addSubview(leftBGView)
        
        
        // wall 
        
        
        let blockSize = CGFloat(GameCreateVC.blockSize!)
        
        let wallView:UIImageView = UIImageView(frame: CGRectMake(10,10,blockSize , blockSize))
        wallView.userInteractionEnabled = true
        wallView.image = UIImage(named: "mazePattern.png")
        wallView.tag = 1
       
        //self.view.addSubview(wallView)
        
        //elements.append(wallView)
        
        self.view.bringSubviewToFront(self.btnOK);
        self.btnOK.center = wallView.center
        
        
        
        let gothicView:UIImageView = UIImageView(frame: CGRectMake(10,CGFloat(CGRectGetMaxY(wallView.frame)) + 18 ,104/4 , 210/4))
        gothicView.userInteractionEnabled = true
        gothicView.image = UIImage(named: "Gothic.png")
         gothicView.tag = 2
       self.view.addSubview(gothicView)
        
        elements.append(gothicView)
        
        
        let hoodieView:UIImageView = UIImageView(frame: CGRectMake(10,CGFloat(CGRectGetMaxY(gothicView.frame)) + 10 ,204/8 , 422/8))
        hoodieView.userInteractionEnabled = true
        hoodieView.image = UIImage(named: "Hoodie.png")
        hoodieView.tag = 3
        self.view.addSubview(hoodieView)
        
        elements.append(hoodieView)
        
        
        
        let manView:UIImageView = UIImageView(frame: CGRectMake(10,CGFloat(CGRectGetMaxY(hoodieView.frame)) + 10 ,207/8 , 419/8))
        manView.userInteractionEnabled = true
        manView.image = UIImage(named: "Man.png")
        manView.tag = 4
       self.view.addSubview(manView)
        
        elements.append(manView)
        
        
        let teenagerView:UIImageView = UIImageView(frame: CGRectMake(10,CGFloat(CGRectGetMaxY(manView.frame)) + 10 ,207/8 , 419/8))
        teenagerView.userInteractionEnabled = true
        teenagerView.image = UIImage(named: "Teenager.png")
        teenagerView.tag = 5
        self.view.addSubview(teenagerView)
        
        elements.append(teenagerView)

        
        
       
        
        
        let ballView:UIImageView = UIImageView(frame: CGRectMake(10,CGFloat(CGRectGetMaxY(teenagerView.frame)) + 20 ,blockSize-4  , blockSize-4))
        
        ballView.center = self.viewGame.center;
        ballView.userInteractionEnabled = true
        ballView.tag = 6
        ballView.layer.cornerRadius = ballView.frame.size.width/2;
        ballView.layer.masksToBounds = true
        //ballView.image = UIImage(named: "Teenager.png")
        
        ballView.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(ballView)
        
        elements.append(ballView)
        
        
         setUpElementsGesture(elements)

  }
    
    func setUpElementsGesture(elementsArr:Array<UIImageView>)
    {
        for imViewElem in elementsArr
        {
            let panGesture = UIPanGestureRecognizer(target: self, action: Selector("viewPanned:"))
            panGesture.maximumNumberOfTouches = 1
            imViewElem.addGestureRecognizer(panGesture)
            imViewElem.userInteractionEnabled = true
            
         //   imViewElem.backgroundColor = UIColor.clearColor()
            
        }
        
        let panGestureGame=UIPanGestureRecognizer(target: self, action: Selector("viewPannedGame:"))
        panGestureGame.maximumNumberOfTouches = 1
        self.viewGame.addGestureRecognizer(panGestureGame)
        
        
    }
    
    
    func viewPannedGame(recognizer:UIPanGestureRecognizer)
    {
        let location:CGPoint = recognizer.locationInView(recognizer.view)
        
        //print(location)
        
        if(recognizer.state == .Began)
        {
            
        }
        else if(recognizer.state == .Changed)
        {
            let locationBoard = GameList.boardLocationFromPoint(location)
            
            //print(locationBoard)
            
            
        }
        else if(recognizer.state == .Ended)
        {
            
        }
        
        
    }
    
    
    func wallOnTap(recognizer:UITapGestureRecognizer)
    {
        
    }
    
    
    
    
    func viewPanned(sender:UIPanGestureRecognizer)
    {
        let imView:UIImageView = sender.view as! UIImageView
       
        
       self.view.bringSubviewToFront(imView)
        
        let ptPan = sender.locationInView(self.view)
        
        if(sender.state == .Began)
        {
           
           

        }
        else if(sender.state == .Changed)
        {
            imView.center = ptPan
        }
        else if(sender.state == .Ended)
        {
           // setUpElementsGesture(elements)
            
            
        }
        
    }
    
    
    func putElementAtFrame(element:UIImageView , frame:CGPoint)
    {
        
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


