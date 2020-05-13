//
//  ViewController.swift
//  KeepCount
//
//  Created by Jort Driegen on 12/05/2020.
//  Copyright © 2020 Jort Driegen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var CountLabel: UILabel!
    var count:Int = 0
    
    @IBOutlet var background: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func stepper(_ sender: UIStepper) {
        if count == 30 {
            
        }
        
        count = Int(sender.value)
        CountLabel.text = String(count)
        
        ChangeBGColor()
          
    }
    
    func ChangeBGColor() -> Void {
        if count >= 30 {
            background.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        } else if count >= 20 && count <= 29 {
            background.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        } else if count >= 10 && count <= 19 {
            background.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        } else if count <= 9 {
            background.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        }
    }
}

