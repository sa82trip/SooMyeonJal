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
        var wokeupTime: Date = Date()
        var goToBedTime: Date = Date()
        if let morning = UserDefaults.standard.object(forKey: "wokeupTime") as? Date{
            showsTime.text = stringifyTime(morning)
            wokeupTime = morning
            
        }
        if let night = UserDefaults.standard.object(forKey: "goToBedTime") as? Date{
            showsTimeBed.text = stringifyTime(night)
            goToBedTime = night
        }
        
        
        
        if(wokeupTime < goToBedTime){
            print("night")
            print(goToBedTime.description(with: Locale.current))
        }else {
            print("morning")
            print(wokeupTime.description(with: Locale.current))
        }
        
        
    }
    
    
    @IBOutlet weak var showsTime: UILabel!
    
    @IBOutlet weak var showsTimeBed: UILabel!
    
    @IBAction func stampMoring(_ sender: UIButton) {
        print("Good Morning")
        
        let testDate = Date()
        print(testDate.description(with: Locale.current))
        //누르면 버튼 비활성화 하기. 저녁 되면 풀린다.
        morningButton.isUserInteractionEnabled=false
        
        //누른 시간 저장하기
        UserDefaults.standard.set(testDate, forKey: "wokeupTime")
        
        
    }
    
    @IBAction func stampNight(_ sender: UIButton) {
        print("Good night")
        
        let testDate = Date()
        print(testDate.description(with: Locale.current))
        UserDefaults.standard.set(testDate, forKey: "goToBedTime")
        
    }
    
    func makeCurrentTime()-> String{
        let currentTime = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        return formatter.string(from: currentTime)
    }
    
    func stringifyTime(_ a: Date)->String{
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        return formatter.string(from: a)
    }
    
    
    @IBAction func clearTime(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Remove stored time", message: "want to delete?", preferredStyle: .alert)
        let removeConfirm = UIAlertAction(title: "delete", style: .destructive, handler: { _ in
            self.showsTimeBed.text = ""
            self.showsTime.text = ""
            UserDefaults.standard.set(nil, forKey: "wokeupTime")
            UserDefaults.standard.set(nil, forKey: "goToBedTime")
            return
        })
        
        let cancelIt = UIAlertAction(title: "cancel", style: .cancel, handler: { (action)->Void in
            print("cancel")
        })
        alertController.addAction(removeConfirm)
        alertController.addAction(cancelIt)
        present(alertController, animated: true, completion: nil)
        
        
    }
}



    
