//
//  deckFavoriteControl.swift
//  SURF_Translate
//
//  Created by Legeng Liu on 6/15/16.
//  Copyright © 2016 SURF. All rights reserved.
//

import UIKit

class DeckFavoriteControl: UIView {
    
    //MARK: properties
    var isFavorite = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    
    //init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        //adding images
        button.setImage(emptyStarImage, forState: .Normal)
        button.setImage(filledStarImage, forState: .Selected)
        button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
        button.adjustsImageWhenHighlighted = false
        
        button.addTarget(self, action: #selector(DeckFavoriteControl.favButtonTapped(_:)), forControlEvents: .TouchDown)    //makes the favButtonTapped sort of the Action item; instead of doing this in the interface builder, we are doing this with code
        
        addSubview(button)
    }
    
    //make the size of star customizable
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height) //frame refers to the frame of this class itself
        let width = buttonSize
        
        return CGSize(width: width, height: buttonSize)
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        let buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        button.frame = buttonFrame
        
        updateFavButton()
    }
    
    //MARK: Action
    
    func favButtonTapped(button: UIButton){
        isFavorite = !isFavorite
        updateFavButton()
    }
    
    func updateFavButton() {
        button.selected = isFavorite
    }

}
