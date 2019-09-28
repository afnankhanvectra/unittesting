//
//  ViewController.swift
//  UnitTestTutorial
//
//  Created by Afnan Khan on 9/19/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var done: UIButton!
    @IBOutlet weak var testingLabel: UILabel!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @discardableResult func check(guess : Int) -> Int {
         return guess * 100
    }

    @IBAction func testingButtonPressed(_ sender: Any) {
        print("Testing....")
        debugPrint("Tesint....")
        testingLabel.text = "Its done"
    }
    
}

