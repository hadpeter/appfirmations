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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let affirmation = allAffirmations?.list[0]
        quote.text = affirmation?.text
    }


}

