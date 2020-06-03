//
//  AffirmationsTableViewController.swift
//  appfirmations
//
//  Created by Hadley Peterson on 6/2/20.
//  Copyright © 2020 Hadley Peterson. All rights reserved.
//

import UIKit
import os.log

class AffirmationsTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var favList = [Affirmation]()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // TODO: LOAD DATA
        if let savedAffirmations = loadAffirmations() {
            favList += savedAffirmations
        }
        else {
            // display no favorites yet
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "AffirmationTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AffirmationTableViewCell  else {
            fatalError("The dequeued cell is not an instance of AffirmationTableViewCell.")
        }
        let affirmation = favList[indexPath.row]
        
        cell.affirmationBlurb.text = affirmation?.text

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func saveMeals() {
        // attempt to save meal list
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(favList, toFile: Affirmation.ArchiveURL.path)
        // log success of saving to console
        if isSuccessfulSave {
            os_log("Affirmation saved successfully", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save", log: OSLog.default, type: .error)
        }
    }
    
    // returns type optional array of Meal objects
    private func loadAffirmations() -> [Affirmation]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Affirmation.ArchiveURL.path) as? [Affirmation]
    }
    
}