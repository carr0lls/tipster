//
//  ViewController.swift
//  tipster
//
//  Created by CARROLL YU on 3/10/17.
//  Copyright © 2017 CARROLL YU. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    @IBOutlet weak var subtotalField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipChoice: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        print("tip view did load")
        let defaults = UserDefaults.standard
        tipChoice.selectedSegmentIndex = defaults.integer(forKey: "tipChoice")

        let currentTime = NSDate()
        let lastUpdated = defaults.object(forKey: "lastUpdated") ?? currentTime
        let billAmount = defaults.object(forKey: "billAmount") ?? 0
        let interval = currentTime.timeIntervalSince(lastUpdated as! Date)

        // Use last bill amount if it was updated within the last 10 minutes
        if (interval < 600) {
            subtotalField.text = String(describing: billAmount)
            calculateTip(self)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        print("view did disappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func updateBillAmount(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        let currentTime = NSDate()
        defaults.set(currentTime, forKey: "lastUpdated")
        defaults.set(subtotalField.text, forKey: "billAmount")
        defaults.synchronize()
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.1, 0.15, 0.2]
        let subtotal = Double(subtotalField.text!) ?? 0
        let tip = Double(subtotal * tipPercentages[tipChoice.selectedSegmentIndex])
        let total = Double(subtotal + tip)
            
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}
