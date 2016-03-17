//
//  ViewController.swift
//  tipster
//
//  Created by Joseph Park on 3/14/16.
//  Copyright © 2016 Joseph Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet var percentageOutletCollection: [UILabel]!
    @IBOutlet var tipOutletCollection: [UILabel]!
    @IBOutlet var groupSizeLabel: UILabel!
    private var groupSize: Int = 1
    private var tipPercent: Double = 5
    private var decimalPressed: Bool = false
    
    
    @IBOutlet var totalOutletCollection: [UILabel]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalValue.text = "0"
    }

    @IBAction func digitPressed(sender: UIButton) {
        if totalValue.text! == "0" {
            totalValue.text = String(sender.tag)
        }
        else {
            totalValue.text = totalValue.text! + String(sender.tag)
        }
        calcAllValues()
        
    }
    
    //resets all values and clears text
    @IBAction func cancelAll(sender: UIButton) {
        totalValue.text = "0"
        decimalPressed = false
        calcAllValues()
    }
    
    //adds decimal point to string
    @IBAction func decimalPoint(sender: UIButton) {
        if !decimalPressed {
            decimalPressed = true
            totalValue.text = totalValue.text! + "."
            calcAllValues()
        }
        
    }
    
    //change tip percentage
    @IBAction func tipPercentChangeSlider(sender: UISlider) {
         tipPercent = Double(sender.value)
        for i in 0...2 {
            let percent = String(tipPercent + (Double(i) * 5))
            percentageOutletCollection[i].text = percent + "%"
        }
        calcAllValues()
    }
    
    //change group's size
    @IBAction func groupSizeChangeSlider(sender: UISlider) {
        groupSize = Int(sender.value)
        groupSizeLabel.text = String(groupSize) + " person(s)"
        calcAllValues()
    }

    func calcAllValues() {
        let value:Double = Double(totalValue.text!)!
        for i in 0...2 {
            let percent = Double(tipPercent + (Double(i) * 5)) / 100
            
            //Update UI with tip amounts (show 2 decimal places)
            let tip = (value * percent) / Double(groupSize)
            let tipUpdate = String(format:"%.2f", tip)
            tipOutletCollection[i].text = "$" + String(tipUpdate)
            
            //Update UI with total amounts (show 2 decimal places)
            let total = value + (tip * Double(groupSize))
            let totalUpdate = String(format:"%.2f", total)
            totalOutletCollection[i].text = "$" + String(totalUpdate)
        }
    }
}

