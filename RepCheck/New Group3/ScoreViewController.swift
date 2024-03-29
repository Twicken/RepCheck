//
//  ScoreViewController.swift
//  RepCheck
//
//  Created by Joel Wall on 30/6/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController, UIPopoverControllerDelegate {

    //Get the model.
    var model = Model.sharedInstance
    @IBOutlet weak var newSearchButton: UIButton!
    //Outlet for talking to our view
    @IBOutlet weak var backButton: UIButton!
    //If button is back button is pressed, go back to previous view controller
    //This has to be done programatically, as we have a custom back button.
    @IBAction func triggered(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func NewSearchTriggered(_ sender: Any) {
        //have the history table know its no longer editing.
        model.history.currentlyModifyingSearch = -1
        //reset all things to new
        model.searchFields.resetStep2()
        model.searchFields.resetStep1()
        model.searchFields.resetSwitches()

        
    }
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        var message = "Would you like to save this search to history?"
        if model.history.currentlyModifyingSearch >= 0 {
            message = "Would you like to update this search in history?"
        }
        //new alert for saving of search
        let alertController = UIAlertController(title: "RepCheck", message: message, preferredStyle: .alert)
        
        // Create an action to be added to the alert with a title,
        let yesButton = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
            print("Search saved to History")
            self.model.history.addSearch()
            //modifying mode over
            self.model.history.currentlyModifyingSearch = -1
        })
        
        let  noButton = UIAlertAction(title: "No", style: .destructive, handler: { (action) -> Void in
            //modifying mode over
            self.model.history.currentlyModifyingSearch = -1
            print("Search not Saved")
        })
        
        alertController.addAction(yesButton)
        alertController.addAction(noButton)
        
        self.navigationController!.present(alertController, animated: true, completion: nil)
        
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //if needed in future
    }
    

}
