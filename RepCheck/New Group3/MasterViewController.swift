//
//  MasterViewController.swift
//  RepCheck
//
//  Created by Joel Wall on 5/7/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import UIKit


class MasterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var backButton: UIButton!
    //This outlet connects the controller to the view so we can modify it. changes mase to this variable change the view!
    @IBOutlet weak var tableView: UITableView!
    //Get the model.
    var model = Model.sharedInstance
    
    //If button is back button is pressed, go back to previous view controller
    //This has to be done programatically, as we have a custom back button.
    @IBAction func triggered(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
        super.viewDidAppear(true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source
    // The number of segments in the table view.
    func numberOfSections(in tableView: UITableView) -> Int {
        //We just need one segmenet since we don't have many options.
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Return the number of cells in the tableview
        return model.resultList.results.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "URLCell", for: indexPath)
        
        // Access the default properties of the prototype cell
        // Must set you prototype cell be display the subtitle
        // in storyboard
        cell.textLabel?.text = model.resultList.results[indexPath.item].title
        cell.detailTextLabel?.text = "Result"
        
        return cell
    }
    
    //for detecting clicks
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //choose what details will be shown.
        model.detailNum = indexPath.item
    }
    

}
