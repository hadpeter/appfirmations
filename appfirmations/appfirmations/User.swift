//
//  User.swift
//  appfirmations
//
//  Created by Hadley Peterson on 5/27/20.

import UIKit

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
        currentAffirmation.fav = true
        favList.append(currentAffirmation)
    }
}
