//
//  DeckTableViewController.swift
//  SURF_Translate
//
//  Created by Legeng Liu on 6/1/16.
//  Copyright © 2016 SURF. All rights reserved.
//

import UIKit

class DeckTableViewController: UITableViewController{
    
    //MARK: Properties:
    
    //keeps array of Deck objects
    var decks = [Deck]()
    
    //implementing search. "nil" means no new view controller needed when searching
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredDecks = [Deck]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    
         //making sample Cards and Decks to test stuff
         
        var sampleCards = [Card]()
        
        let card1 = Card(firstPhrase: "1", secondPhrase: "2", numTimesUsed: 0)
        let card2 = Card(firstPhrase: "english", secondPhrase: "arabic", numTimesUsed : 0)
        let card3 = Card(firstPhrase: "I need water", secondPhrase: "أحتاج إلى الماء", numTimesUsed :0)
        sampleCards += [card1, card2, card3]
        
        
        let deck1 = Deck(name: "Refugee", cards: sampleCards, language1: "English", language2: "Arabic")!
        let deck2 = Deck(name: "UNHCR Phrasebook", cards: sampleCards, language1: "English", language2: "Arabic")!
        let deck3 = Deck(name: "UNHCR Phrasebook Extended", cards: sampleCards, language1: "English", language2: "Arabic")!
        let deck4 = Deck(name: "Doctors to Refugees", cards: sampleCards, language1: "English", language2: "Arabic")!
        let deck5 = Deck(name: "Commonly used in camp", cards: sampleCards, language1: "English", language2: "Arabic")!
        let deck6 = Deck(name: "Customized deck", cards: sampleCards, language1: "English", language2: "Arabic")!
        let deck7 = Deck(name: "Imported Online", cards: sampleCards, language1: "English", language2: "Arabic")!
        decks += [deck1, deck2, deck3, deck4, deck5, deck6, deck7]
        
        
        
//MARK: search
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        // un-comment code below to *not* hide navigation bar. In this case need to implement pop-up keyboard
        // searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func filterContentForSearchText(searchText: String){
        filteredDecks = decks.filter{deck in
            return deck.name.lowercaseString.containsString(searchText.lowercaseString)
        }
        tableView.reloadData()
    }

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
        
        cell.deckName.text = deck.name
        cell.numberOfCards.text = "Cards:" + String(deck.cards.count)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     
     
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // when implementing this, select the correct Deck using filteredDecks[indexPath.row] (refer to CandySearch]
        // Pass the selected object to the new view controller.
    }
    */

}


extension DeckTableViewController: UISearchResultsUpdating{
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}




