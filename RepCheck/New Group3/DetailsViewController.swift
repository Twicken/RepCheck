//
//  DetailsViewController.swift
//  RepCheck
//
//  Created by Joel Wall on 30/6/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var snippetLabel: UILabel!
    //Outlet for talking to our back button in view
    @IBOutlet weak var backButton: UIButton!
    //If button is back button is pressed, go back to previous view controller
    //This has to be done programatically, as we have a custom back button.
    @IBAction func triggered(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        titleLabel.text = Model.sharedInstance.resultList.results[Model.sharedInstance.detailNum].title
        linkLabel.text = Model.sharedInstance.resultList.results[Model.sharedInstance.detailNum].displayLink

        snippetLabel.text = Model.sharedInstance.resultList.results[Model.sharedInstance.detailNum].snippet

        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
