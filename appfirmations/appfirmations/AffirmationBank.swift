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
        
        let first = Affirmation(text: "hehe hoho", author: "Hadley", fav: true)
        self.list = [first]
        
        let url = URL(fileURLWithPath: path ?? "")
        do {
            let data = try Data(contentsOf: url)
            print("Got data", data)
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [Any]
            // let json = try JSONSerialization.jsonObject(with: data, options: [])
            print("Got json")
            let arr = json ?? []
            print(" made array")
            for entry in arr{
                guard let entryDic = entry as? [String: Any] else {return}
                print("entryDic made")
                guard let text = entryDic["text"] as? String else {return}
                print("text made")
                guard let author = entryDic["author"] as? String else {return}
                let temp = Affirmation(text: text, author: author, fav: true)
                self.list.append(temp)
            }
        }
        catch{
            print("error getting data")
        }
        
    }// end of init
    
    // returns a random affirmation from the affirmation bank list
    func getRandomElement() -> Affirmation {
        let index = Int.random(in: 0 ..< list.count)
        return self.list[index]
    }
}
