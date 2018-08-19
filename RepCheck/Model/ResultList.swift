//
//  Result.swift
//  RepCheck
//
//  Created by Joel Wall on 13/7/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//
import Foundation
import UIKit

//stores a list of results gotten back from the custom search api.
class ResultList{
    var results: [Result] = []
    
    //calculates a score for the user. 
    func calculateScore(){
        //out of 7
        var sites = 0.0
        var searchfields = Model.sharedInstance.searchFields
        for result in results{
            if result.displayLink == "www.facebook.com" && searchfields.switches["facebook"]!{
                sites = sites + 1
            }
            if result.displayLink == "www.linkedin.com" && searchfields.switches["linkedIn"]!{
                sites = sites + 1
            }
            if result.displayLink == "twitter.com" && searchfields.switches["twitter"]!{
                sites = sites + 1
            }
            if result.displayLink == "www.instagram.com" && searchfields.switches["instagram"]!{
                sites = sites + 1
            }
            if result.displayLink == "www.youtube.com" && searchfields.switches["youtube"]!{
                sites = sites + 1
            }
            
        }
        var score = (sites/7)*100
        if score > 100{
            score = 100
        }
        Model.sharedInstance.currentScore = Int(score)
    }
}



