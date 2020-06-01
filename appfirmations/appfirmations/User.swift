//
//  User.swift
//  appfirmations
//
//  Created by Hadley Peterson on 5/27/20.

import UIKit
import os.log

class User {
    var userName: String?
    var affirmationsList: AffirmationBank?
    var favList: [Affirmation]
    var currentAffirmation: Affirmation
    
    init(name: String) {
        userName = name
        affirmationsList = AffirmationBank()
        favList = []
        currentAffirmation = (affirmationsList?.getRandomElement())!
    }
    
    func getRandomElement() -> Affirmation {
        currentAffirmation = (affirmationsList?.getRandomElement())!
        return currentAffirmation
    }
    
    func updateFav() {
        if currentAffirmation.fav == true{
            // want to unfav
            currentAffirmation.fav = false
            print("Need to implement deleting fav")
        }
        else {
            currentAffirmation.fav = true
            favList.append(currentAffirmation)
            // need to savefav list
            let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(favList, toFile: Affirmation.ArchiveURL.path)
            if isSuccessfulSave {
                os_log("Affirmation fav successfully saved.", log: OSLog.default, type: .debug)
            } else {
                os_log("Failed to save favorite...", log: OSLog.default, type: .error)
            }
        }
    }
    
    // need to call this when pulling up fav affirmations
    private func loadFavs() -> [Affirmation]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Affirmation.ArchiveURL.path) as? [Affirmation]
    }
}
