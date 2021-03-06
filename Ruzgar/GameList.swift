//
//  GameList.swift
//  Ruzgar
//
//  Created by aybek can kaya on 19/01/16.
//  Copyright © 2016 aybek can kaya. All rights reserved.
//

import Foundation


enum GameBlock:Int
{
    case gameBlockBackground = 0
    case gameBlockMaze = 1
    case gameBlockGothic
    case gameBlockHoodie
    case gameBlockMan
    case gameBlockTeenager
    case gameBlockBall
    
}


class GameList:NSObject
{
    
    var ID:Int = 0
    
    let gamePlistName = "gameList";
    
    var gameArray:NSArray?
    {
        get{
            
            // get from Plist
            
            assert(self.ID == 0, "ID should not be NULL")
            
            let list = Plist(plistName: gamePlistName)
            
            let arr:NSArray = list.read(withKey: String(self.ID)) as! NSArray
            
            return arr
        }
        set(newArr){
            
            // save to Plist 

            self.saveGameListArr()
        }
    }
    
    /**
     Creates empty Game List object
     
     */
    override init()
    {
        super.init()
        
    }
    
    /**
     Initialize game List from its ID.
     
     - parameter theID: ID of the Game
     
     */
    init(withID theID:Int)
    {
        self.ID = theID;
    }
    
    
    private func saveGameListArr()
    {
       assert(self.ID == 0, "ID should not be 0")
        
        let list = Plist(plistName: self.gamePlistName)
        list.write(withKey: String(self.ID), object: self.gameArray!)
        
    }
    
}


/**
   Extensions
*/

extension GameList
{
    static func allGameLists()->NSMutableArray
    {
        var allLists:NSMutableArray = []
        var listArr:NSMutableArray = []
        var gameListObject:GameList?
        
        // 20 x 12 blocks
        
        gameListObject = GameList()
        
listArr = [1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,0,
                0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        
        
        return allLists
    }
}





