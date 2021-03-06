//
//  ViewController.swift
//  appfirmations
//
//  Created by Hadley Peterson on 5/24/20.
//  Copyright © 2020 Hadley Peterson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let user = UsersAPI.sharedInstance.getUser(byName: "John")
    @IBOutlet weak var quote: UITextView!
    @IBAction func favButton(_ sender: UIButton) {
        // change affirmation fav status to true
        user?.updateFav()
    }
    override func viewDidLoad() {
        print("Main view controller")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let affirmation = user?.getRandomElement()
        let signature = affirmation?.author ?? "unkown"
        quote.text = affirmation?.text
        quote.text = quote.text + "\n" + "- " + signature
        quote.isEditable = false
        quote.textAlignment = NSTextAlignment.center
        quote.font = UIFont.init(name: affirmation?.font ?? "Helvetica", size: 18)
    }


}

