//
//  Step1ViewController.swift
//  RepCheck
//
//  Created by Joel Wall on 30/6/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import UIKit

class Step1ViewController: UIViewController {
    //Get the model.
    var model = Model.sharedInstance
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet var resetButton: UIView!
    
    @IBOutlet weak var firstNameBox: UITextField!
    @IBOutlet weak var middleNameBox: UITextField!
    @IBOutlet weak var surnameBox: UITextField!
    @IBOutlet weak var country: UIPickerView!
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        //save inputted text so we can use it later or restore the text boxes.
        model.searchFields.searchFieldsStep1["firstName"] = firstNameBox.text
        model.searchFields.searchFieldsStep1["middleName"] = firstNameBox.text
        model.searchFields.searchFieldsStep1["surname"] = firstNameBox.text
    }

    @IBAction func resetButtonPressed(_ sender: Any) {
        resetInputs()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //remember the past input.
        firstNameBox.text = model.searchFields.searchFieldsStep1["firstName"]
        middleNameBox.text = model.searchFields.searchFieldsStep1["middleName"]
        surnameBox.text = model.searchFields.searchFieldsStep1["surname"]
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
    }

    //may need this code later. It's for programatically going to step 2 rather than by storyboard.
    /*
     @IBAction func triggered(_ sender: Any) {
     let viewControllers: [UIViewController] = self.navigationController!.viewControllers
     for aViewController in viewControllers {
     if aViewController is Step2ViewController {
     
     self.show(aViewController, sender:self)
     
     break
     }else{
     let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
     let nextViewController = storyBoard.instantiateViewController(withIdentifier: "step2")
     (nextViewController as! Step2ViewController).pastViewController=self
     self.show(nextViewController, sender:self)
     }
     }
     }*/
}
