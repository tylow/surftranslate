//
//  Deck.swift
//  SURF_Translate
//
//  Created by Legeng Liu on 6/1/16.
//  Copyright © 2016 SURF. All rights reserved.
//

import UIKit

class Deck {
    
    //MARK: properties
    
    var name: String
    var cards: [Card]
    
    
    
    //MARK: initialization
    // ? doesn't have to initialize. It is an optional. Will not work if there is no name. Makes sure that there has to be a name.
    
    init?(name:String, cards: [Card]) {
        self.name = name
        self.cards = cards
    
        
        
        if name.isEmpty{
            return nil
        }
    }
    
    /* un-comment for use later
     
    //MARK: implementing the NSOBject and NSCoding protocals
    func encodeWithCoder(aCoder: NSCoder) {
        //filler
    }
    
    required convenience init? (coder aDecoder: NSCoder){
        //filler
    }
   */
}
