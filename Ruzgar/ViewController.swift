//
//  ViewController.swift
//  Ruzgar
//
//  Created by aybek can kaya on 19/01/16.
//  Copyright © 2016 aybek can kaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    static var blockSize:Int?
    
    @IBOutlet weak var viewGame: GameView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Lifecycle
        setUpGUI()
        
        // redirection 
        redirectionIfNeeded()
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


/**
  Extensions
*/

extension ViewController
{
    func setUpGUI()
    {
        let imageBG  = UIImage(named: "mazePattern.png")
        self.view.backgroundColor = UIColor(patternImage: imageBG!)
        
    }
    
    func redirectionIfNeeded()
    {
        if(GAME_LIST_CREATE_VC == 1)
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let st = storyboard.instantiateViewControllerWithIdentifier("gameCreateVC")
            
            self.navigationController?.pushViewController(st, animated: true)
        }
        
        
    }
    
}



