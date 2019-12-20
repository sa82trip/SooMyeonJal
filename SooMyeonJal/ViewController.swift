//
//  ViewController.swift
//  SooMyeonJal
//
//  Created by GJS on 2019/12/16.
//  Copyright © 2019 GJS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var morningButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let morning = UserDefaults.standard.object(forKey: "morning") as! Date
        let night = UserDefaults.standard.object(forKey: "night") as! Date
        showsTime.text = morning.description(with: Locale.current)
        showsTimeBed.text = night.description(with: Locale.current)
        
        if(morning < night){
            print("night")
        }else {
            print("morning")
        }
        
        
    }
    
    
    @IBOutlet weak var showsTime: UILabel!
    
    @IBOutlet weak var showsTimeBed: UILabel!
    
    @IBAction func stampMoring(_ sender: UIButton) {
        print("Good Morning")
        let now = makeCurrentTime()
        print(now)
        let testDate = Date()
        print(testDate.description(with: Locale.current))
        //누르면 버튼 비활성화 하기. 저녁 되면 풀린다.
        morningButton.isUserInteractionEnabled=false
        
        //누른 시간 저장하기
        UserDefaults.standard.set(testDate, forKey: "morning")
        
        
    }
    
    @IBAction func stampNight(_ sender: UIButton) {
        print("Good night")
        let now  = makeCurrentTime()
        print(now)
        let testDate = Date()
        print(testDate.description(with: Locale.current))
        UserDefaults.standard.set(testDate, forKey: "night")
        
    }
    
    func makeCurrentTime()-> String{
        let currentTime = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        return formatter.string(from: currentTime)
    }
    
    
    @IBAction func clearTime(_ sender: Any) {
        showsTimeBed.text = ""
        showsTime.text = ""
        UserDefaults.standard.set(nil, forKey: "morning")
        UserDefaults.standard.set(nil, forKey: "night")
    }
}



