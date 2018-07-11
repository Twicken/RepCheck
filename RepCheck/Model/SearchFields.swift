//
//  SearchFields.swift
//  RepCheck
//
//  Created by Joel Wall on 10/7/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import Foundation

//options and option functionality for the options view!
class SearchFields{
    //to store the current search's state
    var searchFieldsStep1 = ["firstName": "", "middleName": "", "surname": "", "country": ""]
    var searchFieldsStep2 = ["town": "", "work": "", "school": "", "optional": ""]
    var switches = ["facebook": true, "linkedIn": true, "twitter": true, "instagram": true, "youtube": true]
    
    init(){
        //initiate
    }
    
    //clears all the search text boxes and resets switches
    func resetStep1(){
        for tuple in searchFieldsStep1 {
            searchFieldsStep1[tuple.key] = ""
        }
    }
    
    func resetStep2(){
        for tuple in searchFieldsStep2 {
            searchFieldsStep2[tuple.key] = ""
        }
    }
    
    func resetSwitches(){
        for tuple in switches {
            switches[tuple.key] = true
        }
    }
}
