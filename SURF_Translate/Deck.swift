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
    var random:Int
    
    
    //MARK: initialization
    
    init?(name:String, cards: [Card], random:Int){
        self.name = name
        self.cards = cards
        self.random = random
        
        
        
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
