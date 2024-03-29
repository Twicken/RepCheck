//
//  HistoryViewController.swift
//  RepCheck
//
//  Created by Joel Wall on 5/7/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import UIKit


class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    //This outlet connects the controller to the view so we can modify it. changes mase to this variable change the view!
    @IBOutlet weak var tableView: UITableView!
    //Get the model.
    var model = Model.sharedInstance
    
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
        return model.history.historyList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)
        
        // Access the default properties of the prototype cell
        // Must set you prototype cell be display the subtitle
        // in storyboard
        cell.textLabel?.text = model.history.historyList[indexPath.item].searchFieldsStep1["firstName"]! + " " + model.history.historyList[indexPath.item].searchFieldsStep1["surname"]!
        cell.detailTextLabel?.text = "History"
        
        
        
        return cell
    }
    
    //for detecting clicks and loading up history for a re-search/modification
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model.searchFields = model.history.historyList[indexPath.row]
        //lets the history class know what entry to overwrite
        model.history.currentlyModifyingSearch = indexPath.row
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    
    
}
