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
    
    init(){}
    
    func addSearch(){
        self.historyList.append(Model.sharedInstance.searchFields)
    }
}
