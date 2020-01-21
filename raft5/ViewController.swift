//
//  ViewController.swift
//  raft5
//
//  Created by admin on 1/20/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //labels
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var numberOfPersonsLabel: UILabel!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    
    @IBOutlet weak var billTxtField: UITextField!
    @IBOutlet weak var percentagesSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var customTipButton: UIButton!
    
    var tipPercentages = [0.05, 0.20, 0.30]
    
    var bill = 0.0
    var splitBillTotal = 0.0
    var tip = 0.0
    var total = 0.0
    var selectedTipPercentage = 0.0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billTxtField.becomeFirstResponder()
        detemineTipPercentageValue(self)
    }
    
    @IBAction func onTap(_ sender: Any)
    {
        view.endEditing(true)
        
    }
    
    
    @IBAction func calculateTip(_ sender: Any)
    {
        
        bill = Double(billTxtField.text!) ?? 0
        tip = selectedTipPercentage * bill
        total  = bill + tip
        
        splitBill()
        updateVariables()
    }
    
    
    func updateVariables()
    {
        tipLabel.text = String(format: "$%.2f",tip)
        billLabel.text = String(format: "$%.2f", bill)
        totalLabel.text = String(format: "$%.2f", total)
        totalPerPersonLabel.text = String(format: "%.2f", splitBillTotal)
    }
    
    @IBAction func detemineTipPercentageValue(_ sender: Any)
    {
        selectedTipPercentage = tipPercentages[percentagesSegmentedControl.selectedSegmentIndex]
        calculateTip(self)
    }
    func splitBill()
    {
        
        let numberOfPeople = Double(numberOfPersonsLabel.text!) ?? 0
        
        if(numberOfPeople != 0)
        {
            
            splitBillTotal = total / numberOfPeople
        }
        
        updateVariables()
        
    }

    @IBAction func subtractNumberOfPeople(_ sender: Any)
    {
        
        var numberOfPeople = Int(numberOfPersonsLabel.text!) ?? 0
        
        
        if(numberOfPeople > 1)
        {
           numberOfPeople -= 1
        numberOfPersonsLabel.text = String(numberOfPeople)
        }
        
        
        splitBill()
    }
    @IBAction func addNumberOfPeople(_ sender: Any)
    {
        
        var numberOfPeople = Int(numberOfPersonsLabel.text!) ?? 0
        
        
        if(numberOfPeople <= 100)
        {
            numberOfPeople += 1
            numberOfPersonsLabel.text = String(numberOfPeople)
        }
        
        
        splitBill()
    }
    
    @IBAction func specifyCustomTip(_ sender: Any)
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let popup = storyBoard.instantiateViewController(withIdentifier: "SliderPopUp") as! SliderPopUp
        popup.delegate = self
        self.present(popup, animated: true)
    }
    
}

extension ViewController: PopUpDelegate
{
    
    func popupSetTip(value: Int) {
        selectedTipPercentage = (Double(value)) / 100.0
        
        calculateTip(self)
    }
}
