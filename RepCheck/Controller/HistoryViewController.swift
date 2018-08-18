//
//  HistoryViewController.swift
//  RepCheck
//
//  Created by Joel Wall on 5/7/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    //This outlet connects the controller to the view so we can modify it. changes mase to this variable change the view!
    @IBOutlet weak var tableView: UITableView!
    //Get the model.
    var model = Model.sharedInstance
    
    override func viewDidLoad() {
        model.history.fetchFromDB()
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        model.history.fetchFromDB()
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
        return model.history.historyList.count
    }
    
    //populates the table view with our history
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)
        cell.textLabel?.text = model.history.historyList[indexPath.item].searchFieldsStep1["firstName"]! + " " +  model.history.historyList[indexPath.item].searchFieldsStep1["surname"]!
        cell.detailTextLabel?.text = "History"
        
        return cell
    }
    
    //for detecting clicks and loading up history for a re-search/modification
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model.searchFields = model.history.historyList[indexPath.row]
        
        
        //lets the history class know what entry to overwrite
        model.history.currentlyModifyingSearch = indexPath.row
    }
    
    
}
