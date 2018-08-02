//
//  APIHandler.swift
//  RepCheck
//
//  Created by Joel Wall on 30/6/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import Foundation
import UIKit
protocol Refresh{
    func updateUI()
}
//holds all out model data once instansiated
class APIHandler{
    
    init(){}
    
    //stores a list of results. will be gotten from api later on
    var score = 0//for storing repscore in future
    
    
    var delegate: Refresh?
    
    private let session = URLSession.shared
    
    private let base_url:String = "https://www.googleapis.com/customsearch/v1?"
    private let key: String = "key=AIzaSyBCvEMwB1ilI3fPYyJcG7ooHXAZJpQN6xQ&"
    private let searchEngineID: String = "cx=005290861916128438356:ftf0fdsm8m0&"
    private let query:String = "q=" + Model.sharedInstance.searchFields.searchFieldsStep1["firstName"]!
    
    //builds url and will fill the result list for our search
    func getResult()
    {
        //clear the results list
        Model.sharedInstance.resultList.results = []
        let url = base_url + key + searchEngineID + query
        
        let escapedAddress = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        
        if let url = URL(string: escapedAddress!)
        {
            let request = URLRequest(url: url)
            getData(request, element: "items")
            
        }
    }
    
    //gets the data from the api
    func getData(_ request: URLRequest, element: String)
    {
        let task = session.dataTask(with: request, completionHandler: {data, response, downloadError in
            
            if let error = downloadError
            {
                print(error)
            }
            else
            {
                var parsedResult: Any! = nil
                
                do{
                    parsedResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                }
                catch{
                    print("Invalid JSON")
                }
                let result = parsedResult as! [String:Any]
                
                if result.keys.contains("items"){
                
                    let allResults = result["items"] as! [[String:Any]]
                    
                    if allResults.count > 0
                    {
                        for r in allResults
                        {
                            let title = r["title"] as! String
                            print(title)
                            
                        }
                    }
                    else
                    {
                        Model.sharedInstance.resultList.results.append(Result())
                    }
                    DispatchQueue.main.async(execute:{
                        self.delegate?.updateUI()
                    })
                }
            }
            
        })
        task.resume()
    }
    
}
