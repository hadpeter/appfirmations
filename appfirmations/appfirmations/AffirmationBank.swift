//
//  AffirmationBank.swift
//  appfirmations
//
//  Created by Hadley Peterson on 5/25/20.
//  Copyright © 2020 Hadley Peterson. All rights reserved.
//

import Foundation
import UIKit

class AffirmationBank: NSObject {
    // Mark Properties - static properties shared across all quotes
    var list: [Affirmation]
    
    // Mark Initialization
    init?(isEmpty: Bool) {
        // Check for nil cases
        // Check text is not be empty
        //        guard !text.isEmpty else {
        //            return nil
        //        }
        
        // Initialize stored properties. -- need to add a functionality to pull data from a file and create Affirmations accordingly, appending each to list
        var first = Affirmation(text: "hehe hoho", author: "Hadley", fav: true)
        self.list = [first]
        first = Affirmation(text: "Am I good enough? Yes I am.", author: "Michelle Obama", fav: true)
        self.list.append(first)
    }
    
    // returns a random affirmation from the affirmation bank list
    func getRandomElement() -> Affirmation {
        let index = Int.random(in: 0 ..< list.count)
        return self.list[index]
    }
}
