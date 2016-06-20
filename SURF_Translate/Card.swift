//
//  Card.swift
//  SURF_Translate
//
//  Created by Legeng Liu on 6/1/16.
//  Copyright © 2016 SURF. All rights reserved.
//

import UIKit

class Card/* :NSObject, NSCoding*/{
    
    //MARK: properties
    //phrases, recordings, languages etc.
    
    var firstPhrase: String
    var secondPhrase: String
    
    //For the Most Used sorting function. Increment every time user taps the Sound Button
    var numTimesUsed: Int

    /*
    //persistent data
    struct PropertyKey{
        static let firstPhraseKey = "first"
        static let secondPhraseKey = "second"
        static let numUsedKey = "numTimes"
    }
    
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("cards")
    
    */
    
    //Init
    init?(firstPhrase:String, secondPhrase:String, numTimesUsed:Int){
        self.firstPhrase = firstPhrase
        self.secondPhrase = secondPhrase
        self.numTimesUsed = numTimesUsed
        //super.init()
        
        if firstPhrase.isEmpty && secondPhrase.isEmpty{
            return nil
        }
    }
    /*
    //MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(firstPhrase, forKey: PropertyKey.firstPhraseKey)
        aCoder.encodeObject(secondPhrase, forKey: PropertyKey.secondPhraseKey)
        aCoder.encodeInteger(numTimesUsed, forKey: PropertyKey.numUsedKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let firstPhrase = aDecoder.decodeObjectForKey(PropertyKey.firstPhraseKey) as! String
        
        let secondPhrase = aDecoder.decodeObjectForKey(PropertyKey.secondPhraseKey) as! String
        
        let numTimesUsed = aDecoder.decodeIntegerForKey(PropertyKey.numUsedKey)
        
        // Must call designated initializer.
        self.init(firstPhrase: firstPhrase, secondPhrase: secondPhrase, numTimesUsed: numTimesUsed)
    }
 */
}
