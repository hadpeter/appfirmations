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
        
        // Initialize stored properties.
        let first = Affirmation(text: "hehe hoho", fav: true)
        if isEmpty {
            self.list = []
        }
        else {
            self.list = [first]
        }
    }
}
