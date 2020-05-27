//
//  ViewController.swift
//  appfirmations
//
//  Created by Hadley Peterson on 5/24/20.
//  Copyright © 2020 Hadley Peterson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allAffirmations = AffirmationBank(isEmpty: false)

    @IBOutlet weak var quote: UITextView!
    @IBAction func favButton(_ sender: UIButton) {
        // change affirmation fav status to true
        // add fav to user's list of favs
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let affirmation = allAffirmations?.getRandomElement()
        let signature = affirmation?.author ?? "unkown"
        quote.text = affirmation?.text
        quote.text = quote.text + "\n" + "- " + signature
        quote.isEditable = false
        quote.textAlignment = NSTextAlignment.center
        quote.font = UIFont.init(name: affirmation?.font ?? "Helvetica", size: 18)
    }


}

