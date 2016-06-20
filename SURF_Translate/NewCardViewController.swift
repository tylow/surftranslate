//
//  NewDeckViewController.swift
//  SURF_Translate
//
//  Created by Legeng Liu on 6/11/16.
//  Copyright © 2016 SURF. All rights reserved.
//

import UIKit

class NewCardViewController: UIViewController, UINavigationControllerDelegate, UITextViewDelegate {
    
    //MARK: Properties
    
    
    
    @IBOutlet weak var translateFromTextView: UITextView!
    @IBOutlet weak var translateToTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    //audio buttons
    @IBOutlet weak var audioDelete: UIButton!
    @IBOutlet weak var audioRecordStop: UIButton!
    @IBOutlet weak var audioPlay: UIButton!
    
    var newCard = Card?()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        translateFromTextView.delegate = self
        translateToTextView.delegate = self
        
        //make sure save button is diabled when first starts
        checkValidCard()
        
        
        //adding borders to textview
        translateFromTextView.layer.borderWidth = 0.5
        translateFromTextView.layer.borderColor = UIColor.lightGrayColor().CGColor
        translateFromTextView.layer.cornerRadius = 4.0
        
        translateToTextView.layer.borderWidth = 0.5
        translateToTextView.layer.borderColor = UIColor.lightGrayColor().CGColor
        translateToTextView.layer.cornerRadius = 4.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    @IBAction func cancelNewCard(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let translateFrom = translateFromTextView.text!
            let translateTo = translateToTextView.text!
            
            newCard = Card(firstPhrase: translateFrom, secondPhrase: translateTo, numTimesUsed: 0)
        }

    }
    
    //MARK: UITextViewDelegate
    
    func textViewDidBeginEditing(textView: UITextView) {
        //delete prompt text when user preses on textview
        checkValidCard()
        if textView == translateFromTextView && textView.text == "First phrase of this card"{
            translateFromTextView.text = ""
            
        } else if textView == translateToTextView && textView.text == "Second phrase of this card"{
            translateToTextView.text = ""
            
        }
        
    }
   
    func textViewDidEndEditing(textView: UITextView) {
        checkValidCard()
    }
    
    func textViewDidChange(textView: UITextView) {
        checkValidCard()
    }
    
    //gets rid of keyboard
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func checkValidCard() {
        // Disable the Save button if the text field is empty.
        let text1 = translateFromTextView.text ?? ""
        let text2 = translateToTextView.text ?? ""
        if text1.isEmpty && text2.isEmpty{
            saveButton.enabled = false
        } else if text1 == "First phrase of this card" && text2 == "Second phrase of this card"{
            saveButton.enabled = false
        } else {
            saveButton.enabled = true
        }
    }
    
}
