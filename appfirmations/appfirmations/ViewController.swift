//
//  ViewController.swift
//  appfirmations
//
//  Created by Hadley Peterson on 5/24/20.
//  Copyright © 2020 Hadley Peterson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quote: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let affirmation = Affirmation(text: "affirmation goes here", fav: true)
        quote.text = affirmation?.text
    }


}

