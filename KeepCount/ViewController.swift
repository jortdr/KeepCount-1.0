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
    
    @IBOutlet weak var AddOneButton: UIButton!
    @IBOutlet weak var RemoveOneButton: UIButton!
    
    
    
    
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func AddOnePressed(_ sender: Any) {
        count += 1
        
        CountLabel.text = String(count)
    }
    @IBAction func RemOnePressed(_ sender: Any) {
        if count != 0 {
            count -= 1
            
            CountLabel.text = String(count)
        }
    }
}

