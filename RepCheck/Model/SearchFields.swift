//
//  SearchFields.swift
//  RepCheck
//
//  Created by Joel Wall on 10/7/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import Foundation
import CoreData

//options and option functionality for the options view!
struct SearchFields{
    
    
    //to store the current search's state
    var searchFieldsStep1 = ["firstName": "", "middleName": "", "surname": "", "country": ""]
    var searchFieldsStep2 = ["town": "", "work": "", "school": "", "optional": ""]
    var switches = ["facebook": true, "linkedIn": true, "twitter": true, "instagram": true, "youtube": true]
    //for finding our copy in coredata
    var objectID = NSManagedObjectID()
    
    //get list of countries
    var countries: [String] = {
        
        var arrayOfCountries: [String] = []
        //add a blank country for top of the array, in case the user does not want to specify
        arrayOfCountries.append("")
        for code in NSLocale.isoCountryCodes as [String] {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id)
            arrayOfCountries.append(name!)
        }
        return arrayOfCountries
    }()
    
    init(){
        //initiate
    }
    
    //clears all the search text boxes and resets switches
    mutating func resetStep1(){
        for tuple in searchFieldsStep1 {
            searchFieldsStep1[tuple.key] = ""
        }
    }
    
    mutating func resetStep2(){
        for tuple in searchFieldsStep2 {
            searchFieldsStep2[tuple.key] = ""
        }
    }
    
    mutating func resetSwitches(){
        for tuple in switches {
            switches[tuple.key] = true
        }
    }
}
