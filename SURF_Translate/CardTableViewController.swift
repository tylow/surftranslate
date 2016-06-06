//
//  CardTableViewController.swift
//  SURF_Translate
//
//  Created by Legeng Liu on 6/2/16.
//  Copyright © 2016 SURF. All rights reserved.
//

import UIKit

class CardTableViewController: UITableViewController {
    
    //MARK: properties
    
    var cards = [Card]() //keeps track of all the Card objects
    
    //search
    let searchController = UISearchController(searchResultsController: nil)
    var filteredCards = [Card]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
  /*
        //search
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
*/
    }
    
    //how to be able to search both top and bottom string?
    func filterContentForSearchText(searchText:String){
        filteredCards = cards.filter { card in
            return card.firstPhrase.lowercaseString.containsString(searchText.lowercaseString)
        }
        tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != ""{
            return filteredCards.count
        }
        return cards.count
    }
/*
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let card: Card
        if searchController.active && searchController.searchBar.text != "" {
            card = filteredCards[indexPath.row]
        } else {
            card = cards[indexPath.row]
        }
        /*
        //error: topPhrase and bottomPhrase text boxes have NOT been made
        cell.topPhrase?.text = card.firstPhrase
        cell.bottomPhrase?.text = card.secondPhrase
        return cell
        */
    }
*/

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
        
        /*
        let card: Card
        if searchController.active && searchController.searchBar.text != ""{
            card = filteredCards[indexPath.row]
         } else {
            card = cards[indexPath.row]
         }
        */
    }
    */
}

/*
 //does not work yet..
 extension CardTableViewController: UISearchResultsUpdating {
 func updateSearchResultsForSearchController(searchController: UISearchController) {
 filterContentForSearchText(searchController.searchBar.text!)
 }
 }
 */

