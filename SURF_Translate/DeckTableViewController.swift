//
//  DeckTableViewController.swift
//  SURF_Translate
//
//  Created by Legeng Liu on 6/1/16.
//  Copyright © 2016 SURF. All rights reserved.
//

import UIKit

class DeckTableViewController: UITableViewController, UINavigationControllerDelegate, CardTableVCDelegate{
    
    
    
    //MARK: Properties:

    //keeps array of Deck objects
    var decks = [Deck]()
    
     //favoriteDecks is used *internally* to keep track of all my favorite decks. For sorting purposes etc.
     // every time a Deck is favorited, add it to the favoriteDecks array, but also have it in the normal decks array, because the tableview controller displays the decks array. favoriteDecks is not displayed and only used to keep track internally.
    var favoriteDecks = [Deck]()
    
    //implementing search. "nil" means no new view controller needed when searching
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredDecks = [Deck]()
    

    var selectedDeck: Deck? //set this to deck gets selected
    
    
    func updateFavoriteDecks(){
        favoriteDecks = decks.filter{$0.isFavorite == true}
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        /*
        if let savedDecks = loadDecks(){
            decks += savedDecks
        } /* else {
            loadSampleDecks() //need to make this method at some point
        } */
        */
    
         //making sample Cards and Decks to test stuff
        
        /*
        var sampleCards = [Card]()
        var sampleCards2 = [Card]()
        var sampleCards3 = [Card]()
        
        let card1 = Card(firstPhrase: "1", secondPhrase: "2", numTimesUsed: 0)!
        let card2 = Card(firstPhrase: "english", secondPhrase: "arabic", numTimesUsed : 0)!
        let card3 = Card(firstPhrase: "I need water", secondPhrase: "أحتاج إلى الماء", numTimesUsed :0)!
        let card4 = Card(firstPhrase: "Hello", secondPhrase: "Salaam", numTimesUsed: 0)!
            
        sampleCards += [card1, card2, card3, card4]
        sampleCards2 += [card1, card3, card4]
        sampleCards3 += [card3, card4]
        
        
        let deck1 = Deck(name: "Refugee", cards: sampleCards, language1: "English", language2: "Arabic", isFavorite: true)!
        let deck2 = Deck(name: "UNHCR Phrasebook", cards: sampleCards2, language1: "English", language2: "Arabic", isFavorite: true)!
        let deck3 = Deck(name: "UNHCR Phrasebook Extended extended extended extended extended dddddddddddddddddddddddddddddddd", cards: sampleCards, language1: "English", language2: "Arabic", isFavorite: false)!
        let deck4 = Deck(name: "Doctors to Refugees", cards: sampleCards, language1: "English", language2: "Arabic", isFavorite: false)!
        let deck5 = Deck(name: "Commonly used in camp", cards: sampleCards, language1: "English", language2: "Arabic", isFavorite: false)!
        let deck6 = Deck(name: "Customized deck", cards: sampleCards, language1: "English", language2: "Arabic", isFavorite: false)!
        let deck7 = Deck(name: "Imported Online", cards: sampleCards3, language1: "English", language2: "Arabic", isFavorite: false)!
        decks += [deck1, deck2, deck3, deck4, deck5, deck6, deck7]
        
 
        //filtering favorited decks from all decks
        favoriteDecks = decks.filter{$0.isFavorite == true}
        
        */
        
//MARK: search
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = true  //maybe we should set this to true?
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func filterContentForSearchText(searchText: String){
        filteredDecks = decks.filter{deck in
            return deck.name.lowercaseString.containsString(searchText.lowercaseString)
        }
        tableView.reloadData()
    }

    //idk what this does
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //when searching, return the # of Decks that fit search criteria, otherwise return total #
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredDecks.count
        } else {
            return decks.count
        }
    }

    //lets DeckTableViewController set the values inside each cell to decks that are already filtered
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "DeckTableViewCell" //this unique identifier can be edited in Attributes section of Cell object
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DeckTableViewCell

        var deck: Deck
        
        if searchController.active && searchController.searchBar.text != "" {
            deck = filteredDecks[indexPath.row]
        } else {
            deck = decks[indexPath.row]
        }
        selectedDeck = deck //keeps track of which one is selected
        
        cell.deckName.text = deck.name
        cell.numberOfCards.text = "Cards:" + String(deck.cards.count)
        cell.deckFavoriteControl.isFavorite = deck.isFavorite
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            // Delete the row from the data source
            decks.removeAtIndex(indexPath.row)
            // saveDecks()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     
     
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var selected: Deck
    
        //below: different actions depending on which segue is beling called
        
        if segue.identifier == "EditDeck"{
            let destinationNavController = segue.destinationViewController as! UINavigationController
            let editDeckViewController = destinationNavController.topViewController as! NewDeckViewController
            if let selectedDeckCell = sender as? DeckTableViewCell{
                let indexPath = tableView.indexPathForCell(selectedDeckCell)!
                if searchController.active && searchController.searchBar.text != "" {
                    selected = filteredDecks[indexPath.row]
                } else {
                    selected = decks[indexPath.row]
                }
                editDeckViewController.newDeck = selected
            }
        } else if segue.identifier == "ShowCards"{
        
            let showCardsViewController = segue.destinationViewController as! CardTableViewController
            showCardsViewController.delegate = self
            
            if let selectedDeckCell = sender as? DeckTableViewCell{
                let indexPath = tableView.indexPathForCell(selectedDeckCell)!
                
                if searchController.active && searchController.searchBar.text != "" {
                    selected = filteredDecks[indexPath.row]
                } else {
                    selected = decks[indexPath.row]
                }
                showCardsViewController.cards = selected.cards
                showCardsViewController.navigationItem.title? = selected.name
                
                selectedDeck = selected
                
            }
        } else if segue.identifier == "AddDeck"{
            print ("add new deck")
        }
    }
    
    @IBAction func unwindToDeckList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.sourceViewController as? NewDeckViewController, newDeck = sourceViewController.newDeck {
            
            //replacing edited Decks
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                print("row selected")
                
                
                if searchController.active && searchController.searchBar.text != "" {
                    let temp = filteredDecks[selectedIndexPath.row]
                    let index: Int = decks.indexOf({$0 === temp})!
                    decks[index] = newDeck
                    updateFavoriteDecks()
                    tableView.reloadData()
                } else {
                    decks[selectedIndexPath.row] = newDeck
                    updateFavoriteDecks()
                    tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
                }
                
            } else {
                print("no row selected")
                // if new made Deck is favorited, then this code below puts it on top, below the other Favorited decks.
                if newDeck.isFavorite == true{
                    let newIndexPath = NSIndexPath(forRow: favoriteDecks.count, inSection: 0)
                    decks.insert(newDeck, atIndex: favoriteDecks.count)
                    tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
                    
                    updateFavoriteDecks()
                    
                    // if not a Favorite, then put on bottom of all the decks
                } else {
                    let newIndexPath = NSIndexPath(forRow: decks.count, inSection: 0)
                    decks.append(newDeck)
                    tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
                }
            }
            //saveDecks()  //persistence
        }
    }
    
    
    //MARK: Editing
    //tapping the accessory "i" button doesn't automatically select row. This selects row
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: .None)
    }
    
    /*
    //MARK: NSCoding
    func saveDecks(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(decks, toFile: Deck.ArchiveURL.path!)
        if !isSuccessfulSave{
            print("failed to save decks")
        }
    }
    
    func loadDecks() -> [Deck]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Deck.ArchiveURL.path!) as? [Deck]
    }
    */
    
    //MARK: delegate
    //function that is delegated to CardTableVC
    func updateDeck(card:Card){
        for x in decks{
            if x === selectedDeck{   //use triple = sign to make sure they *refer* to same object
                x.cards.append(card)
                tableView.reloadData()
            }
        }
    }
    
    func deleteFromDeck(indexPath: NSIndexPath) {
        for x in decks{
            if x === selectedDeck{
                x.cards.removeAtIndex(indexPath.row)
                tableView.reloadData()
            }
        }
    }
    
    
}

extension DeckTableViewController: UISearchResultsUpdating{
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}




