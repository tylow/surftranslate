//
//  Deck.swift
//  SURF_Translate
//
//  Created by Legeng Liu on 6/1/16.
//  Copyright © 2016 SURF. All rights reserved.
//

import UIKit

class Deck/*: NSObject, NSCoding*/ {
    
    //MARK: properties
    
    var name: String
    var cards = [Card]()
    var isFavorite: Bool = false
    
    
    //keeps track of the Deck language so we can sort using the language drop down menu.
    var language1: String?
    var language2: String?
    /*
    //MARK: Types
    struct PropertyKey {
        static let nameKey = "name"
        static let cardsKey = "cards"
        static let favKey = "isFavorite"
        static let firstLanguageKey = "language1"
        static let secondLanguageKey = "language2"
    }
    */
    //MARK: initialization
    
    init?(name:String, cards: [Card], language1:String?, language2:String?, isFavorite: Bool){
        self.name = name
        self.cards = cards
        self.language1 = language1
        self.language2 = language2
        self.isFavorite = isFavorite
        
        //super.init()

        if name.isEmpty{
            return nil
        }
    }
    
    /*
    //MARK: implementing the NSOBject and NSCoding protocals
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(cards, forKey: PropertyKey.cardsKey)
        aCoder.encodeBool(isFavorite, forKey: PropertyKey.favKey)
        aCoder.encodeObject(language1, forKey: PropertyKey.firstLanguageKey)
        aCoder.encodeObject(language2, forKey: PropertyKey.secondLanguageKey)
    }
    
    required convenience init? (coder aDecoder: NSCoder){
        //filler
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let cards = aDecoder.decodeObjectForKey(PropertyKey.cardsKey) as! [Card]
        let isFavorite = aDecoder.decodeBoolForKey(PropertyKey.favKey)
        let language1 = aDecoder.decodeObjectForKey(PropertyKey.firstLanguageKey) as! String
        let language2 = aDecoder.decodeObjectForKey(PropertyKey.secondLanguageKey) as! String
        
        self.init(name: name, cards: cards, language1: language1, language2: language2, isFavorite: isFavorite)
    }
    
    //MARK: Archiving paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("decks")
   */
}













