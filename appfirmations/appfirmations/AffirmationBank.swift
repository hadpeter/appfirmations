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
    let path = Bundle.main.path(forResource: "quotes", ofType: "txt")
    
    
    // Mark Initialization
    init?(isEmpty: Bool) {
        // Check for nil cases
        // Check text is not be empty
        //        guard !text.isEmpty else {
        //            return nil
        //        }
        
        // Initialize stored properties. -- need to add a functionality to pull data from a file and create Affirmations accordingly, appending each to list
        self.list = []
        do {
            let content = try String(contentsOfFile: path ?? "")
            
            let arr = content.split(separator: "\n")
            for line in arr{
                let entry = line.split(separator: ";")
                let text = entry[0]
                var author = "unknown"
                if entry.count > 1{
                    author = String(entry[1])
                }
                let temp = Affirmation(text: String(text), author: author, fav: true, font: "AmericanTypewriter")
                self.list.append(temp)
            }
        }
        catch{
            print("error ")
        }
    }// end of init
    
    // returns a random affirmation from the affirmation bank list
    func getRandomElement() -> Affirmation {
        let index = Int.random(in: 0 ..< list.count)
        return self.list[index]
    }
}
