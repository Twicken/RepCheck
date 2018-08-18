//
//  Step2ViewController.swift
//  RepCheck
//
//  Created by Joel Wall on 30/6/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//
import UIKit

class Step2ViewController: UIViewController {
    //Get the model.
    var model = Model.sharedInstance
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var townBox: UITextField!
    @IBOutlet weak var workBox: UITextField!
    @IBOutlet weak var schoolBox: UITextField!
    @IBOutlet weak var otherBox: UITextField!
    //If button is back button is pressed, go back to previous view controller
    //This has to be done programatically, as we have a custom back button.
    @IBAction func triggered(_ sender: Any) {
        //Save inputs then go back
        saveFields()
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func nextButtonPressed(_ sender: Any) {
        //save inputs then go forward via segue
        saveFields()
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        //reset values in model
        model.searchFields.resetStep2()
        //clear text boxes
        townBox.text = ""
        workBox.text = ""
        schoolBox.text = ""
        otherBox.text = ""
    }
    
    // Become first responder to get shake motion
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    // Enable detection of shake motion and reset values to default
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            townBox.text = ""
            workBox.text = ""
            schoolBox.text = ""
            otherBox.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //get the past inputs.
        townBox.text = model.searchFields.searchFieldsStep2["town"]
        workBox.text = model.searchFields.searchFieldsStep2["work"]
        schoolBox.text = model.searchFields.searchFieldsStep2["school"]
        otherBox.text = model.searchFields.searchFieldsStep2["optional"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func saveFields(){
        //save inputted text so we can use it later or restore the text boxes.
        model.searchFields.searchFieldsStep2["town"] = townBox.text
        model.searchFields.searchFieldsStep2["work"] = workBox.text
        model.searchFields.searchFieldsStep2["school"] = schoolBox.text
        model.searchFields.searchFieldsStep2["optional"] = otherBox.text
    }
}
