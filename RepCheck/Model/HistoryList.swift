//
//  HistoryList.swift
//  RepCheck
//
//  Created by Joel Wall on 11/7/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import CoreData
import UIKit
class HistoryList{
    //stores a list of searches. this is fetched from the database.
    var historyList = [SearchFields]()
    //-1 means that we are not modifying a search currently.
    var currentlyModifyingSearch :Int = -1
    
    init(){}
    
    
    
    //saves a search to the list
    func addSearch(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        var newSearch : NSManagedObject
        
        //if its a modification of a search
        if currentlyModifyingSearch > -1{
            //change the new search to be the one already in coredata.
            newSearch = context.object(with: Model.sharedInstance.searchFields.objectID)
        }else{
            //if its a brand new search.
            let entity = NSEntityDescription.entity(forEntityName: "Search", in: context)
            newSearch = NSManagedObject(entity: entity!, insertInto: context)
        }

        //commit first step values to coredata
        newSearch.setValue(Model.sharedInstance.searchFields.searchFieldsStep1["firstName"], forKey: "firstName")
        newSearch.setValue(Model.sharedInstance.searchFields.searchFieldsStep1["middleName"], forKey: "middleName")
        newSearch.setValue(Model.sharedInstance.searchFields.searchFieldsStep1["surname"], forKey: "surname")
        newSearch.setValue(Model.sharedInstance.searchFields.searchFieldsStep1["country"], forKey: "country")
        
        //commit second step values to coredata
        newSearch.setValue(Model.sharedInstance.searchFields.searchFieldsStep2["town"], forKey: "town")
        newSearch.setValue(Model.sharedInstance.searchFields.searchFieldsStep2["work"], forKey: "work")
        newSearch.setValue(Model.sharedInstance.searchFields.searchFieldsStep2["school"], forKey: "school")
        newSearch.setValue(Model.sharedInstance.searchFields.searchFieldsStep2["optional"], forKey: "optional")
        
        //commit third step values to coredata
        newSearch.setValue(Model.sharedInstance.searchFields.switches["facebook"], forKey: "facebook")
        newSearch.setValue(Model.sharedInstance.searchFields.switches["linkedIn"], forKey: "linkedIn")
        newSearch.setValue(Model.sharedInstance.searchFields.switches["twitter"], forKey: "twitter")
        newSearch.setValue(Model.sharedInstance.searchFields.switches["instagram"], forKey: "instagram")
        newSearch.setValue(Model.sharedInstance.searchFields.switches["youtube"], forKey: "youtube")

        //save to coredata
        do {
            try context.save()
        } catch {
            print("Failed saving data!")
        }
    
        
    }
    
    func fetchFromDB(){
        //for building our searchfields object from our coredata.
        var tempSearchFields = SearchFields()
        //clear the history list so we can refresh it.
        historyList.removeAll()
        //get the core data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Search")
        request.returnsObjectsAsFaults = false
        //fetch the values from the record.
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                
                tempSearchFields.objectID = data.objectID
                tempSearchFields.searchFieldsStep1["firstName"] = data.value(forKey: "firstName") as? String
                tempSearchFields.searchFieldsStep1["middleName"] = data.value(forKey: "middleName") as? String
                tempSearchFields.searchFieldsStep1["surname"] = data.value(forKey: "surname") as? String
                tempSearchFields.searchFieldsStep1["country"] = data.value(forKey: "country") as? String
                tempSearchFields.searchFieldsStep2["town"] = data.value(forKey: "town") as? String
                tempSearchFields.searchFieldsStep2["work"] = data.value(forKey: "work") as? String
                tempSearchFields.searchFieldsStep2["school"] = data.value(forKey: "school") as? String
                tempSearchFields.searchFieldsStep2["optional"] = data.value(forKey: "optional") as? String
                tempSearchFields.switches["facebook"] = data.value(forKey: "facebook") as? Bool
                tempSearchFields.switches["linkedIn"] = data.value(forKey: "linkedIn") as? Bool
                tempSearchFields.switches["twitter"] = data.value(forKey: "twitter") as? Bool
                tempSearchFields.switches["instagram"] = data.value(forKey: "instagram") as? Bool
                tempSearchFields.switches["youtube"] = data.value(forKey: "youtube") as? Bool
                
                self.historyList.append(tempSearchFields)
            }
            
        } catch {
            
            print("Failed to fetch data!")
        }
    }
    
    //deletes all from database.
    func deleteAll(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Search")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
        do
        {
            try context.execute(deleteRequest)
            try context.save()
        }
        catch
        {
            print ("There was an error")
        }
    }
    
}
