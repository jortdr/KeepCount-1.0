//
//  ViewController.swift
//  KeepCount
//
//  Created by Jort Driegen on 12/05/2020.
//  Copyright © 2020 Jort Driegen. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    //iOS App
    @IBOutlet weak var CountLabel: UILabel!
    var count:Int = 0
    
    @IBOutlet var background: UIView!
    @IBOutlet weak var ResetButton: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    //End iOS App
    
    //Start iOS Widget

    
    //End iOS Widget

    
    
    let tooMany = UIAlertController(title: "Actie niet toegestaan", message: "Je zit nu op het huidige maximumaantal van 30 personen.", preferredStyle: .alert)
    
    let resetWarning = UIAlertController(title: "Waarschuwing", message: "Weet je zeker dat je het aantal wilt herstellen?", preferredStyle: .alert)
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tooMany.addAction(UIAlertAction(title: "Oké", style: .cancel, handler: nil))
        
        resetWarning.addAction(UIAlertAction(title: "Nee", style: .cancel, handler: nil))
        
        resetWarning.addAction(UIAlertAction(title: "Ja", style: .destructive, handler: { action in
            self.res()
        }))
        
        
        count = defaults.integer(forKey:"countKey")
        stepper.value = Double(defaults.integer(forKey: "countKey"))
        ChangeBGColor()
        

    }
    

    @IBAction func stepper(_ sender: UIStepper) {
        if stepper.value > 30 {
            self.present(tooMany, animated: true)
            stepper.value -= 1
        } else {
        
        count = Int(sender.value)
        ChangeBGColor()
        
            defaults.set(count, forKey: "countKey")
            
        }
    }
    
    @IBAction func ResetPress(_ sender: Any) {
        self.present(resetWarning, animated: true)
    }
    
    func res() -> Void {
        count = 0
        stepper.value = 0
        CountLabel.text = String(count)
        ChangeBGColor()
        
        defaults.set(count, forKey: "countKey")
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
            background.backgroundColor = #colorLiteral(red: 0.2901960784, green: 0.8431372549, blue: 0.5137254902, alpha: 1)
        }
    }
}

