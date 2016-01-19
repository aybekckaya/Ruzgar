//
//  Plist.swift
//  PlistSwift
//
//  Created by aybek can kaya on 16/01/16.
//  Copyright © 2016 aybek can kaya. All rights reserved.
//

import Foundation

class Plist: NSObject {

    /**
     Initializes Plist object from contents of sourcePath , then copies the list to destination Path. If the file at destination path found , then it will not re-copy the contents.
     
     - parameter nameFrom: Plist name at the bundle
     - parameter nameTo:   copied file name for destination
     
     
     */
    
    private var plistName:String!
    
    var namePlist:String {
    
        get{
            return self.plistName
        }
    }
    
    
    var plistPath:String {
    
        get{
            
            let documentPath = self.documentsPath()
            let fullName = documentPath+"/"+self.plistName+".plist"
            
            return fullName
        }
    }
    
    
    init(withSourcePlistName nameFrom:String , destinationPlistName nameTo:String )
    {
        super.init()
        
        
        //let fromPlistName = nameFrom+".plist"
        let bundlePathFrom = NSBundle.mainBundle().pathForResource(nameFrom, ofType: "plist")
        
        assert(self.fileExistAtPath(path: bundlePathFrom!) , "Plist not found at bundle path")
        
        let toPlistName = nameTo+".plist"
        let documentPath = self.documentsPath()
        
        let toPlistFullPath = documentPath+"/"+toPlistName
        
        if(!self.fileExistAtPath(path: toPlistFullPath))
        {
            let contents :NSMutableDictionary?=NSMutableDictionary(contentsOfFile: bundlePathFrom!)
            contents?.writeToFile(toPlistFullPath, atomically: true)
        }
        
        self.plistName = nameTo
        
        
    }
    
    
    /**
     Initializes Plist with given name . If plist found at path then gets the contents of list  , else creates empty plist with empty mutable Dictionary
     
     - parameter name: name of Plist
     
     
     */
    init(plistName name:String)
    {
        super.init()
        
        let nameListSuffix = name+".plist"
        let documentPath = self.documentsPath()
        let fullName = documentPath+"/"+nameListSuffix
        
        if(!self.fileExistAtPath(path: fullName))
        {
            let tempContent:NSMutableDictionary = NSMutableDictionary()
            tempContent.writeToFile(fullName, atomically: true)
        }
       
        self.plistName = name
        
    }
    

    private func  documentsPath()->String
    {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        guard paths.count > 0 else
        {
            return ""
        }
        
        let documentsDirectory = paths[0]
        
        return documentsDirectory
    }

    
    private func fileExistAtPath(path thePath:String)->Bool
    {
        let fileManager = NSFileManager.defaultManager()
        
        if(fileManager.fileExistsAtPath(thePath))
        {
            return true
        }
        
        return false
    }
    
    
    func write(withKey key:String! , object theObj:AnyObject)
    {
       
            let fullName = self.plistPath
            
             let currentDct:NSMutableDictionary = NSMutableDictionary(contentsOfFile: fullName)!
            currentDct.setObject(theObj, forKey: key)
            
            currentDct.writeToFile(fullName, atomically: true)
        
       
    }
    
    
    
    func read(withKey key:String?)->AnyObject
    {
        let currentDct:NSMutableDictionary = NSMutableDictionary(contentsOfFile: self.plistPath)!
        
        let allKeys:NSArray = currentDct.allKeys
       
        guard allKeys.containsObject(key!) else
        {
            return ""
        }
        
        return currentDct[key!]!
        
    }
    
    
    func readAllContents()->AnyObject
    {
        let currentDct:NSMutableDictionary = NSMutableDictionary(contentsOfFile: self.plistPath)!
        
        return currentDct
    }
    
    
    func deleteObject(withKey key:String)
    {
        let contentsAll:NSMutableDictionary = self.readAllContents() as! NSMutableDictionary
        
        contentsAll.removeObjectForKey(key)
        
        contentsAll.writeToFile(self.plistPath, atomically: true)
    }
    
    
    func deleteAllItems()
    {
        let tempDct:NSMutableDictionary = NSMutableDictionary()
        
        tempDct.writeToFile(self.plistPath, atomically: true)
    }
    
    
    func allKeys()->Array<AnyObject>
    {
        let allContents = self.readAllContents()
        let arrKeys = allContents.allKeys
        
        return arrKeys
    }
    
    
    static func allPlists()->Array<Plist>
    {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        let documentsDirectory = paths[0]
        
        var allFiles = [AnyObject]()
        do
        {
             allFiles = try  NSFileManager.defaultManager().contentsOfDirectoryAtPath(documentsDirectory)
            
        }catch let error as NSError{
            
            print(error.debugDescription)
        }
        
        
        var arrLists = [Plist]()
         for index in 0...allFiles.count-1
         {
            let theFileName:NSString = allFiles[index] as! NSString
            
            print(theFileName)
            
            let lengthName = theFileName.length
            
            let suffix:String = theFileName.substringWithRange(NSMakeRange(lengthName-6, 6))
            
            if(suffix == ".plist")
            {
                let prefix:String = theFileName.substringToIndex(lengthName-6)
               // let fullPath = documentsDirectory+"/"+prefix+".plist";
                
                let plist = Plist(plistName: prefix)
                arrLists.append(plist)
            }
            
        }
        
        return arrLists
        
    }
    
    
    
}
