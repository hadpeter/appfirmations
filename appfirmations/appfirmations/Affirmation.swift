//
//  quote.swift
//  appfirmations
//
//  Created by Hadley Peterson on 5/24/20.
//  Copyright © 2020 Hadley Peterson. All rights reserved.
//

import UIKit
import os.log

class Affirmation: NSObject, NSCoding {
    // Mark Properties - static properties shared across all quotes
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    struct PropertyKey {
        static let text = "text"
        static let author = "author"
        static let fav = "fav"
        static let font = "font"
    }
    
    var text: String
    var author: String
    var fav: Int
    var font: String
    
    // Mark Initialization
    init(text: String, author: String, fav: Int, font: String) {
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
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: PropertyKey.text)
        aCoder.encode(author, forKey: PropertyKey.author)
        aCoder.encode(fav, forKey: PropertyKey.fav)
        aCoder.encode(font, forKey: PropertyKey.font)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let text = aDecoder.decodeObject(forKey: PropertyKey.text) as? String else {
            print("Unable to decode the text for an Affirmation object.")
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        guard let author = aDecoder.decodeObject(forKey: PropertyKey.author) as? String else {
            print("Unable to decode the author for an Affirmation object.")
            return nil
        }
        
        // decodeIntegerForKey unarchives an integer
        guard let fav = aDecoder.decodeInteger(forKey: PropertyKey.fav) as? Int else {
            print("Unable to decode the fav for an Affirmation object.")
            return nil
        }
        
        guard let font = aDecoder.decodeObject(forKey: PropertyKey.font) as? String else {
            print("Unable to decode the font for an Affirmation object.")
            return nil
        }
        
        // Must call designated initializer.
        self.init(text: text, author: author, fav: fav, font: font)
        
    }
}
