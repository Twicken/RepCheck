//
//  Step1ViewController.swift
//  RepCheck
//
//  Created by Joel Wall on 30/6/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import UIKit

class Step1ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    //Get the model.
    var model = Model.sharedInstance
    //our view item outlets.
    @IBOutlet weak var firstNameBox: UITextField!
    @IBOutlet weak var country: UIPickerView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet var resetButton: UIView!
    @IBOutlet weak var middleNameBox: UITextField!
    @IBOutlet weak var surnameBox: UITextField!
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        //save inputted text so we can use it later or restore the text boxes.
        model.searchFields.searchFieldsStep1["firstName"] = firstNameBox.text
        model.searchFields.searchFieldsStep1["middleName"] = middleNameBox.text
        model.searchFields.searchFieldsStep1["surname"] = surnameBox.text
        model.searchFields.searchFieldsStep1["country"] = model.searchFields.countries[country.selectedRow(inComponent: 0)]
    }

    @IBAction func resetButtonPressed(_ sender: Any) {
        resetInputs()
    }
    
    // To get shake gesture and hide the keyboard once Done selected
    // Shake Gesture as approved by instructor Fardin as Cocoa substitute.
        override func viewDidLoad() {
        super.viewDidLoad()
        firstNameBox.delegate=self
        middleNameBox.delegate=self
        surnameBox.delegate=self
        
        self.becomeFirstResponder()
            
    }
    
    // Workaround to allow user to hide the iOS keyboard after input
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstNameBox.resignFirstResponder()
        middleNameBox.resignFirstResponder()
        surnameBox.resignFirstResponder()
        
        return true
    }
    
    
    // Become first responder to get shake motion
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    // Enable detection of shake motion and reset values to default
    // Shake motion approved by instructor Fardin as Cocoa implementation
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            resetInputs()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //remember the past input.
        firstNameBox.text = model.searchFields.searchFieldsStep1["firstName"]
        middleNameBox.text = model.searchFields.searchFieldsStep1["middleName"]
        surnameBox.text = model.searchFields.searchFieldsStep1["surname"]
        super.viewDidAppear(true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func resetInputs(){
        //reset values in model
        model.searchFields.resetStep1()
        //clear text boxes
        firstNameBox.text = ""
        middleNameBox.text = ""
        surnameBox.text = ""
        country.reloadAllComponents()
        country.selectRow(0, inComponent: 0, animated: true)
    }
    
    //the below functions are for the country picker.
    //this sets the number of columns in the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //sets the amount of items in the picker (number of countries)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return model.searchFields.countries.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return model.searchFields.countries[row]
    }
    
    
    
}
