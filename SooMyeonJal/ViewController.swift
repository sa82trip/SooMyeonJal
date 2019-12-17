//
//  ViewController.swift
//  SooMyeonJal
//
//  Created by GJS on 2019/12/16.
//  Copyright © 2019 GJS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func stampMoring(_ sender: UIButton) {
        print("Good Morning")
        let currentTime = Date()
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        print(formatter.string(from: currentTime))
//        formatter.dateFormat = "yyyy/MM/dd HH:mm"
    }
    
    @IBAction func stampNight(_ sender: UIButton) {
        print("Good night")
        let currentTime = Date()
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        print(formatter.string(from: currentTime))
    }
    
}

