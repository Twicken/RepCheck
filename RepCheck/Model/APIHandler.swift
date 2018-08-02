//
//  APIHandler.swift
//  RepCheck
//
//  Created by Joel Wall on 30/6/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import Foundation
import UIKit

//sets up protocol to be used with delegate
protocol Refresh{
    func updateUI()
}
//holds all out model data once instansiated
class APIHandler{
    
    init(){}
    
    var delegate: Refresh?
    
    private let session = URLSession.shared
    
    private let base_url:String = "https://www.googleapis.com/customsearch/v1?"
    private let key: String = "key=AIzaSyBCvEMwB1ilI3fPYyJcG7ooHXAZJpQN6xQ&"
    private let searchEngineID: String = "cx=005290861916128438356:ftf0fdsm8m0&"
    private var query:String = "q="
    var searchFields = Model.sharedInstance.searchFields
    
    func buildQuery(){

        //cant loop here due to the disordered nature of dictionaries in swift.
        query = query + searchFields.searchFieldsStep1["firstName"]! + " "
        query = query + searchFields.searchFieldsStep1["middleName"]! + " "
        query = query + searchFields.searchFieldsStep1["surname"]! + " "
        query = query + searchFields.searchFieldsStep1["country"]! + " "
        
        query = query + searchFields.searchFieldsStep2["town"]! + " "
        query = query + searchFields.searchFieldsStep2["work"]! + " "
        query = query + searchFields.searchFieldsStep2["school"]! + " "
        query = query + searchFields.searchFieldsStep2["optional"]!
    }
    
    
    
    
    //builds url and will fill the result list for our search
    func getResult()
    {
        //clear the results list
        Model.sharedInstance.resultList.results = []
        buildQuery()
        print(query)
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
                            let resultObject = Result(title: r["title"] as! String, displayLink: r["displayLink"] as! String, snippet: r["snippet"] as! String)
                            Model.sharedInstance.resultList.results.append(resultObject)
                        }
                    }
                }
                Model.sharedInstance.resultList.calculateScore()
                DispatchQueue.main.async(execute:{
                    self.delegate?.updateUI()
                })
                
            }
            
        })
        task.resume()
    }
    
}
