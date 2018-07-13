//
//  HistoryList.swift
//  RepCheck
//
//  Created by Joel Wall on 11/7/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import Foundation

class HistoryList{
    //stores a list of searches. later to be done with database.
    var historyList = [SearchFields]()
    //-1 means that we are not modifying a search currently.
    var currentlyModifyingSearch :Int = -1
    
    init(){}
    
    //saves a search to the list
    func addSearch(){
        //if its a new search
        if currentlyModifyingSearch < 0{
            self.historyList.append(Model.sharedInstance.searchFields)
        //if its a search from the history menu
        }else{
            historyList[currentlyModifyingSearch] = Model.sharedInstance.searchFields
        }
    }
}
