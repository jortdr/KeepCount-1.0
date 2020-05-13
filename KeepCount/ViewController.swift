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
    @IBOutlet weak var ResetButton: UIButton!
    @IBOutlet weak var stepper: UIStepper!

    
    let tooMany = UIAlertController(title: "Actie niet toegestaan", message: "Je zit nu op het huidige maximumaantal van 30 personen.", preferredStyle: .alert)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tooMany.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        
    }

    @IBAction func stepper(_ sender: UIStepper) {
        if stepper.value > 30 {
            self.present(tooMany, animated: true)
            stepper.value -= 1
        } else {
        
        count = Int(sender.value)
        ChangeBGColor()
            
            
        }
    }
    
    @IBAction func ResetPress(_ sender: Any) {
        count = 0
        stepper.value = 0
        CountLabel.text = String(count)
        ChangeBGColor()
        
    }
    
    func ChangeBGColor() -> Void {
        CountLabel.text = String(count)
        
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

