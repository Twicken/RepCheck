//
//  OptionsViewController.swift
//  RepCheck
//
//  Created by Joel Wall on 12/6/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import UIKit


class OptionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    //This outlet connects the controller to the view so we can modify it. changes mase to this variable change the view!
    @IBOutlet weak var tableView: UITableView!
    //Get the model.
    var model = Model.sharedInstance
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    // The number of segments in the table view.
    func numberOfSections(in tableView: UITableView) -> Int {
        //We just need one segmenet since we don't have many options.
        return model.options.sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Return the number of cells in the tableview
        return model.options.optionsList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Access the default properties of the prototype cell
        // Must set you prototype cell be display the subtitle
        // in storyboard
        cell.textLabel?.text = model.options.optionsList[indexPath.item]
        cell.detailTextLabel?.text = "An Option"
        
        
        
        return cell
     }
    
    //for detecting clicks
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //if option 1 was selected, show about box
        if indexPath.row == 1{
            //new alert for showing about
            let alertController = UIAlertController(title: "RepCheck version 1.1 Alpha", message: "By Joel Wall & Joseph Galati", preferredStyle: .alert)
    
            let  OKButton = UIAlertAction(title: "OK", style: .destructive, handler: { (action) -> Void in
            })
            
            alertController.addAction(OKButton)
            
            self.present(alertController, animated: true, completion: nil)
        }
        //if clear history selected.
        if indexPath.row == 0{
            //new alert for showing about
            let alertController = UIAlertController(title: "Delete all search history", message: "Are you sure you want to delete all previous search history? This cannot be undone.", preferredStyle: .alert)
            
            let  OKButton = UIAlertAction(title: "Yes", style: .destructive, handler: { (action) -> Void in
                self.model.options.doOption(optionNum: indexPath.row)
            })
            let  NoButton = UIAlertAction(title: "No", style: .destructive, handler: { (action) -> Void in
              
            })
            
            alertController.addAction(OKButton)
            alertController.addAction(NoButton)
            self.present(alertController, animated: true, completion: nil)
        }
    }


}

