//
//  ListDataManager.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation

class ListDataManager: NSObject {
    let session: NSURLSession = {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        return NSURLSession(configuration: config)
    }()
    
    func fetchDiligences(completion completion: ([DiligenceItem]) -> Void) {
        
        let url = ClientAPI.diligencesMine()
        let request = NSMutableURLRequest(URL: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Token d8326786c9028d42e8f7d48fe799406f0e2e294e", forHTTPHeaderField: "Authorization")            
        
        let task = session.dataTaskWithRequest(request, completionHandler: {
            (data, response, error) -> Void in
            
            let result = self.processDiligencesRequest(data: data, error: error)
            let diligencesArray: [DiligenceItem]
            
            if case let .Success(diligences) = result {
                diligencesArray = diligences
            }
            else {
                diligencesArray = []
            }
            
            completion(diligencesArray)
        })
        task.resume()
    }
    
    func processDiligencesRequest(data data: NSData?, error: NSError?) -> DiligenceResult {
        guard let jsonData = data else {
            return .Failure(error!)
        }
        
        return ClientAPI.diligencesFromJSONData(jsonData)
    }
}