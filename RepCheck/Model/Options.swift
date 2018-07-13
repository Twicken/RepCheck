//
//  OptionsList.swift
//  RepCheck
//
//  Created by Joel Wall on 30/6/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import Foundation

//options and option functionality for the options view!
struct Options {
    
    //Has our list of Options as strings that will be passed to the controller and displayed in view.
    var optionsList = [String]()
    let sections = 1
        
    
    init(){
        self.optionsList.append("Clear History")
        self.optionsList.append("About RepCheck")
    }
    
    func doOption(optionNum: Int){
        //clear history
        if optionNum == 0{
            Model.sharedInstance.history.historyList.removeAll()
        }
        
    }
}
