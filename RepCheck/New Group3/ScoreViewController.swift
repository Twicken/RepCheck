//
//  ScoreViewController.swift
//  RepCheck
//
//  Created by Joel Wall on 30/6/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import UIKit
import CoreData

class ScoreViewController: UIViewController, UIPopoverControllerDelegate, Refresh {
    
    @IBOutlet weak var scoreBar: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    //use of delegate to update the score.
    func updateUI() {
        scoreLabel.text = String(model.currentScore)
        self.scoreBar.image = cropSideImage(image: scoreBar.image!)
    }
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
        let handler = APIHandler()
        handler.delegate=self
        handler.getResult()

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
    
    //for cropping our score bar, depending on the score.
    func cropSideImage(image: UIImage) -> UIImage {
        let height = CGFloat(image.size.height)
        var scoreMultiplier: CGFloat
        scoreMultiplier = (CGFloat(model.currentScore)/100)
        let rect = CGRect(x: 0, y: 0, width: image.size.width * scoreMultiplier, height: height)
        return cropImage(image: image, toRect: rect)

    }


    func cropImage(image:UIImage, toRect rect:CGRect) -> UIImage{
        let croppedCGImage:CGImage = (image.cgImage?.cropping(to: rect))!
        let croppedImage = UIImage(cgImage: croppedCGImage)
        return croppedImage
    }
}
