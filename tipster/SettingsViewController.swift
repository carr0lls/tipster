//
//  SettingsViewController.swift
//  tipster
//
//  Created by CARROLL YU on 3/13/17.
//  Copyright © 2017 CARROLL YU. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipChoice: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        print("settings view did load")
        let defaults = UserDefaults.standard
        tipChoice.selectedSegmentIndex = defaults.integer(forKey: "tipChoice")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setTipAmount(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(tipChoice.selectedSegmentIndex, forKey: "tipChoice")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
