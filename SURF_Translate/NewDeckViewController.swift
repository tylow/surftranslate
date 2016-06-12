//
//  NewDeckViewController.swift
//  SURF_Translate
//
//  Created by Legeng Liu on 6/11/16.
//  Copyright © 2016 SURF. All rights reserved.
//

import UIKit

class NewDeckViewController: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var firstLanguageTextField: UITextField!

    @IBOutlet weak var secondLanguageTextField: UITextField!
    
    var cardsOfNewDeck = [Card]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    @IBAction func saveNewDeck(sender: UIButton) {
        /*if nameTextField.text != ""{
            let newDeck = Deck(name: nameTextField.text!, cards: cards, language1: firstLanguageTextField.text, language2: secondLanguageTextField.text)
            decks += [newDeck]
        }
        */
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
