//
//  Result.swift
//  RepCheck
//
//  Created by Joel Wall on 28/7/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import Foundation

class Result{
    
    var title:String
    var displayLink:String
    var snippet:String
    
    init(title: String, displayLink: String, snippet: String){
        self.title = title
        self.displayLink = displayLink
        self.snippet = snippet
    }
}
