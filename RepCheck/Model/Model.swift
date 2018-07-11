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
    
    //initialise the model
    private init(){
        ///instansiate the options
        self.options = Options()
        //instansiate the search box storagae.
        self.searchFields = SearchFields()
    }
}
