//
//  ViewController.swift
//  tips
//
//  Created by Emma Guo on 1/24/16.
//  Copyright © 2016 emmaguo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalLabel2: UILabel!
    @IBOutlet weak var totalLabel3: UILabel!
    @IBOutlet weak var totalLabel4: UILabel!
    
    let defaultTop = CGFloat(260)
    
    func closePanel() {
        resultViewTopConstraint.constant = defaultTop + resultView.bounds.height
        UIView.animateWithDuration(0.2, animations: {
            self.tipControl.alpha = 0
            self.resultView.layoutIfNeeded()
        })
    }
    
    func openPanel() {
        resultViewTopConstraint.constant = defaultTop
        UIView.animateWithDuration(0.2, animations: {
            self.tipControl.alpha = 1
            self.resultView.layoutIfNeeded()
        })
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        closePanel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        if (billField.text == "") {
            return closePanel()
        }
        
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        let tipAmount = billAmount * tipPercentage
        let totalAmount = billAmount + tipAmount
        let totalAmount2 = totalAmount / 2
        let totalAmount3 = totalAmount / 3
        let totalAmount4 = totalAmount / 4
        
        tipLabel.text = NSString(format: "$%.2f", tipAmount) as String
        totalLabel.text = NSString(format: "$%.2f", totalAmount) as String
        totalLabel2.text = NSString(format: "$%.2f", totalAmount2) as String
        totalLabel3.text = NSString(format: "$%.2f", totalAmount3) as String
        totalLabel4.text = NSString(format: "$%.2f", totalAmount4) as String
        
        openPanel()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}
