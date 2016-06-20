//
//  DeckTableViewController.swift
//  SURF_Translate
//
//  Created by Legeng Liu on 6/1/16.
//  Copyright © 2016 SURF. All rights reserved.
//

import UIKit

class DeckTableViewController: UITableViewController, UINavigationControllerDelegate{
    
    //MARK: Properties:

    //keeps array of Deck objects
    var decks = [Deck]()
    
     //favoriteDecks is used *internally* to keep track of all my favorite decks. For sorting purposes etc.
     // every time a Deck is favorited, add it to the favoriteDecks array, but also have it in the normal decks array, because the tableview controller displays the decks array. favoriteDecks is not displayed and only used to keep track internally.
    var favoriteDecks = [Deck]()
    
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
        var familyCards = [Card]()
        var sampleCards3 = [Card]()
        var medicalTeamCards = [Card]()
        
        let card1 = Card(firstPhrase: "Good Bye", secondPhrase: "مع السلامة", numTimesUsed: 0)!
        let card2 = Card(firstPhrase: "Welcome", secondPhrase: "عفوا", numTimesUsed : 0)!
        let card3 = Card(firstPhrase: "What is your name?", secondPhrase: "ما هو اسمك؟", numTimesUsed :0)!
        let card4 = Card(firstPhrase: "My name", secondPhrase: "اسمي", numTimesUsed: 0)!
        
        //Family Cards:
        
        let card5 = Card(firstPhrase: "This is my family", secondPhrase: "هذه عائلتي ", numTimesUsed: 0)!
        let card6 = Card(firstPhrase: "My wife", secondPhrase: "زوجتي", numTimesUsed: 0)!
        let card7 = Card(firstPhrase: "My daughter", secondPhrase: "ابنتي", numTimesUsed: 0)!
        let card8 = Card(firstPhrase: "My son", secondPhrase: "ابني", numTimesUsed: 0)!
        let card9 = Card(firstPhrase: "My brother", secondPhrase: "اخي", numTimesUsed: 0)!
        let card10 = Card(firstPhrase: "My sister", secondPhrase: "اختي", numTimesUsed: 0)!
        let card11 = Card(firstPhrase: "My father", secondPhrase: "ابي", numTimesUsed: 0)!
        let card12 = Card(firstPhrase: "My mother", secondPhrase: "أمي", numTimesUsed: 0)!
        
        let card13 = Card(firstPhrase: "I am thirsty", secondPhrase: "أنا عطشان", numTimesUsed: 0)!
        let card14 = Card(firstPhrase: "Where is the bathroom", secondPhrase: "أين الحمام", numTimesUsed: 0)!
        let card15 = Card(firstPhrase: "What time is it now?", secondPhrase: "كم هو الوقت الان؟", numTimesUsed: 0)!
        let card16 = Card(firstPhrase: "I need to take a shower", secondPhrase: "أنا أريد ان أخذ دوش", numTimesUsed: 0)!
        let card17 = Card(firstPhrase: "I am tired", secondPhrase: "أنا تعبان", numTimesUsed: 0)!
        let card18 = Card(firstPhrase: "I need to sleep", secondPhrase: "أنا بحاجة لان انام", numTimesUsed: 0)!
        let card19 = Card(firstPhrase: "I am sad", secondPhrase: "أنا حزين", numTimesUsed: 0)!
        let card20 = Card(firstPhrase: "I don't have money", secondPhrase: "لايوجد لدي نقود", numTimesUsed: 0)!
        let card21 = Card(firstPhrase: "Where can I buy?", secondPhrase: "أين يمكنني ان اشتري؟", numTimesUsed: 0)!
        let card22 = Card(firstPhrase: "Bus", secondPhrase: "باص", numTimesUsed: 0)!
        let card23 = Card(firstPhrase: "Train", secondPhrase: "قطار", numTimesUsed: 0)!
        let card24 = Card(firstPhrase: "Station", secondPhrase: "محطة", numTimesUsed: 0)!
        let card25 = Card(firstPhrase: "Europe", secondPhrase: "أوروبا", numTimesUsed: 0)!
        let card26 = Card(firstPhrase: "Syria", secondPhrase: "سوريا", numTimesUsed: 0)!
        let card27 = Card(firstPhrase: "Greece", secondPhrase: "اليونان", numTimesUsed: 0)!
        let card28 = Card(firstPhrase: "Turkey", secondPhrase: "تركيا", numTimesUsed: 0)!
        let card29 = Card(firstPhrase: "Lebanon", secondPhrase: "'لبنان", numTimesUsed: 0)!
        let card30 = Card(firstPhrase: "Jordon", secondPhrase: "الاْردن", numTimesUsed: 0)!
        let card31 = Card(firstPhrase: "What is your final destination", secondPhrase: "ماهي وجهتك الاخيرة؟", numTimesUsed: 0)!
        
        
        
        //Medical Team Cards:
        
        let card32 = Card(firstPhrase: "What is your illness?", secondPhrase: "ماهو مرضك؟", numTimesUsed: 0)!
        let card33 = Card(firstPhrase: "Diebete", secondPhrase: "مرض السكر", numTimesUsed: 0)!
        let card34 = Card(firstPhrase: "Heart Attack", secondPhrase: "سكتة قلبية", numTimesUsed: 0)!
        let card35 = Card(firstPhrase: "Cancer", secondPhrase: "سرطان", numTimesUsed: 0)!
        let card36 = Card(firstPhrase: "Arthritis", secondPhrase: "روماتيزم", numTimesUsed: 0)!
            
        sampleCards += [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16, card17,card18, card19, card20, card21, card22, card23, card24, card25, card26, card27, card28, card29, card30, card31]
        familyCards += [card5, card6, card7, card8, card9, card10, card11, card12]
        sampleCards3 += [card3, card4]
        medicalTeamCards += [card32, card33, card34, card35, card36]
        
        
        let deck1 = Deck(name: "Refugee", cards: sampleCards, language1: "English", language2: "Arabic", isFavorite: true)!
        let deck2 = Deck(name: "Family Phrases", cards: familyCards, language1: "English", language2: "Arabic", isFavorite: true)!
        let deck3 = Deck(name: "UNHCR Phrasebook Extended extended extended extended extended dddddddddddddddddddddddddddddddd", cards: sampleCards, language1: "English", language2: "Arabic", isFavorite: false)!
        let deck4 = Deck(name: "Doctors to Refugees", cards: medicalTeamCards, language1: "English", language2: "Arabic", isFavorite: false)!
        let deck5 = Deck(name: "Commonly used in camp", cards: sampleCards, language1: "English", language2: "Arabic", isFavorite: false)!
        let deck6 = Deck(name: "Customized deck", cards: sampleCards, language1: "English", language2: "Arabic", isFavorite: false)!
        let deck7 = Deck(name: "Imported Online", cards: sampleCards3, language1: "English", language2: "Arabic", isFavorite: false)!
        decks += [deck1, deck2, deck3, deck4, deck5, deck6, deck7]
        
        //filtering favorited decks from all decks
        favoriteDecks = decks.filter{$0.isFavorite == true}

        
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     
     
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var selectedDeck: Deck
        if segue.identifier == "showCards"{
        
            let showCardsViewController = segue.destinationViewController as! CardTableViewController
            
            if let selectedDeckCell = sender as? DeckTableViewCell{
                let indexPath = tableView.indexPathForCell(selectedDeckCell)!
                
                if searchController.active && searchController.searchBar.text != "" {
                    selectedDeck = filteredDecks[indexPath.row]
                } else {
                    selectedDeck = decks[indexPath.row]
                }
                showCardsViewController.cards = selectedDeck.cards
                showCardsViewController.navigationItem.title? = selectedDeck.name
                
            }
        } else if segue.identifier == "AddDeck"{
            print ("add new deck")
        }
    }
    
    @IBAction func unwindToDeckList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? NewDeckViewController, newDeck = sourceViewController.newDeck {
            
            // if new made Deck is favorited, then this code below puts it on top, below the other Favorited decks.
            if newDeck.isFavorite == true{
                let newIndexPath = NSIndexPath(forRow: favoriteDecks.count, inSection: 0)
                decks.insert(newDeck, atIndex: favoriteDecks.count)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
                
                favoriteDecks.append(newDeck)
            
            // if not a Favorite, then put on bottom of all the decks
            } else {
                let newIndexPath = NSIndexPath(forRow: decks.count, inSection: 0)
                decks.append(newDeck)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
    }
}

extension DeckTableViewController: UISearchResultsUpdating{
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}




