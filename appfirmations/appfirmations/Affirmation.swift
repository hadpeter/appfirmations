//
//  quote.swift
//  appfirmations
//
//  Created by Hadley Peterson on 5/24/20.
//  Copyright © 2020 Hadley Peterson. All rights reserved.
//

import UIKit

class Affirmation: NSObject {
    // Mark Properties - static properties shared across all quotes
    var text: String
    var author: String
    var fav: Bool
    var font: String
    
    // Mark Initialization
    init(text: String, author: String, fav: Bool, font: String) {
        // Check for nil cases
        // Check text is not be empty
//        guard !text.isEmpty else {
//            return nil
//        }
        
        // Initialize stored properties.
        self.text = text
        self.author = author
        self.fav = fav
        self.font = font
    }
}
