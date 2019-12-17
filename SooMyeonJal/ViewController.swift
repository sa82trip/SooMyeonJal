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
        let now = makeCurrentTime()
        print(now)
    }
    
    @IBAction func stampNight(_ sender: UIButton) {
        print("Good night")
        let now  = makeCurrentTime()
        print(now)
    }
    
    func makeCurrentTime()-> String{
        let currentTime = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        
        return formatter.string(from: currentTime)
    }
    
}

