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
    
    @IBOutlet weak var saveButton: UIButton!
    
    var newDeck = Deck?()
    
    var cardsOfNewDeck = [Card]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameTextField.delegate = self
        
        //make sure save button is diabled when first starts
        checkValidDeckName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    @IBAction func cancelNewDeck(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = nameTextField.text!
            let firstLanguage = firstLanguageTextField.text ?? ""
            let secondLanguage = secondLanguageTextField.text ?? ""
            
            newDeck = Deck(name: name, cards: cardsOfNewDeck, language1: firstLanguage, language2: secondLanguage)
        }
        
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(TextField: UITextField) {
        // Disable the Save button while editing.
        saveButton.enabled = false
    }
    
    func checkValidDeckName() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }

    func textFieldDidEndEditing(textField: UITextField) {
        checkValidDeckName()
        navigationItem.title = nameTextField.text
    }
}
