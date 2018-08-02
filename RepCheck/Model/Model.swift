//
//  Model.swift
//  RepCheck
//
//  Created by Joel Wall on 30/6/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import Foundation

//holds all out model data once instansiated
class Model{
    
    
    static let sharedInstance = Model()
    //holds our options portion of model data
    let options : Options
    //deals with our search boxes
    var searchFields :SearchFields
    //our search history (to be replaced by database)
    var history : HistoryList
    //for storing our search result
    var resultList : ResultList
    
    //initialise the model
    private init(){
        ///instansiate the options
        self.options = Options()
        //instansiate the search box storagae.
        self.searchFields = SearchFields()
        //do the same for history
        self.history = HistoryList()
        self.resultList = ResultList()
    }
    

    
}
