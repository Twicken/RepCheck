//
//  Step3ViewController.swift
//  RepCheck
//
//  Created by Joel Wall on 30/6/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import UIKit

class Step3ViewController: UIViewController{

    //Get the model.
    var model = Model.sharedInstance
    @IBOutlet weak var facebookSwitch: UISwitch!
    @IBOutlet weak var linkedInSwitch: UISwitch!
    @IBOutlet weak var twitterSwitch: UISwitch!
    @IBOutlet weak var instagramSwitch: UISwitch!
    @IBOutlet weak var youtubeSwitch: UISwitch!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    //If button is back button is pressed, go back to previous view controller
    @IBAction func triggered(_ sender: Any) {
        saveSwitches()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func triggeredSubmit(_ sender: Any) {
        saveSwitches()
     }

    @IBAction func triggeredReset(_ sender: Any) {
        //reset then update view
        model.searchFields.resetSwitches()
        facebookSwitch.isOn = true
        linkedInSwitch.isOn = true
        twitterSwitch.isOn = true
        instagramSwitch.isOn = true
        youtubeSwitch.isOn = true
    }
    
    private func saveSwitches(){
        //save switch state
        model.searchFields.switches["facebook"] = facebookSwitch.isOn
        model.searchFields.switches["linkedIn"] = linkedInSwitch.isOn
        model.searchFields.switches["twitter"] = twitterSwitch.isOn
        model.searchFields.switches["instagram"] = instagramSwitch.isOn
        model.searchFields.switches["youtube"] = youtubeSwitch.isOn
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        //load switch states
        facebookSwitch.isOn = model.searchFields.switches["facebook"]!
        linkedInSwitch.isOn =  model.searchFields.switches["linkedIn"]!
        twitterSwitch.isOn = model.searchFields.switches["twitter"]!
        instagramSwitch.isOn = model.searchFields.switches["instagram"]!
        youtubeSwitch.isOn = model.searchFields.switches["youtube"]!
    }

    
}
