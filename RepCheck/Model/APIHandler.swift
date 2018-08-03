//
//  APIHandler.swift
//  RepCheck
//
//  Created by Joel Wall on 3/8/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import Foundation
import UIKit

//sets up protocol to be used with delegate
protocol Refresh{
    func updateUI()
}
//This class is only used in the getting of data from our google search API in the score scene.
class APIHandler{
    
    init(){}
    
    //delegate for refreshing the screen
    var delegate: Refresh?
    
    //Start a session
    private let session = URLSession.shared
    
    private let base_url:String = "https://www.googleapis.com/customsearch/v1?"
    private let key: String = "key=AIzaSyBCvEMwB1ilI3fPYyJcG7ooHXAZJpQN6xQ&"
    private let searchEngineID: String = "cx=005290861916128438356:ftf0fdsm8m0&"
    private var query:String = "q="
    var searchFields = Model.sharedInstance.searchFields
    
    //this makes us a search query based on the user inputs during the first 2 steps.
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
        //build the query
        buildQuery()
        let url = base_url + key + searchEngineID + query
        
        let escapedAddress = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        
        if let url = URL(string: escapedAddress!)
        {
            let request = URLRequest(url: url)
            //now get the data and have it be stored in the resultList in our model.
            getData(request, element: "items")
            
        }
    }
    
    //gets the data from the api and stores it in the resulList inside the model.
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
                            //save the title url and text snippet from search result.
                            let resultObject = Result(title: r["title"] as! String, displayLink: r["displayLink"] as! String, snippet: r["snippet"] as! String)
                            Model.sharedInstance.resultList.results.append(resultObject)
                        }
                    }
                }
                //calculate the score for the user, so it can be displayed. then refresh.
                Model.sharedInstance.resultList.calculateScore()
                DispatchQueue.main.async(execute:{
                    self.delegate?.updateUI()
                })
                
            }
            
        })
        task.resume()
    }
    
}
