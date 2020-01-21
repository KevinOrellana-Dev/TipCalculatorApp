//
//  SliderPopUp.swift
//  raft5
//
//  Created by admin on 1/20/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SliderPopUp: UIViewController {

    @IBOutlet weak var sliderTipLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    var sliderValue = 30
    var delegate: PopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func saveCustomTip(_ sender: Any)
    {
        delegate?.popupSetTip(value: sliderValue)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func sliderValueChange(_ sender: Any)
    {
        sliderValue = Int(slider.value)
        sliderTipLabel.text = String(sliderValue) + "%"
    }
    
    
    


}
