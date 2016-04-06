//
//  AddDataManager.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation

class AddDataManager : NSObject {
    let session: NSURLSession = {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        return NSURLSession(configuration: config)
    }()
    let dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd 'at' HH:mm"
        formatter.timeZone = .systemTimeZone()
        return formatter
    }()
    
    //MARK: Public
    func addNewEntry(entry: DiligenceItem, completion: (Bool) -> Void) {
        let url = ClientAPI.diligences()
        
        let expireDateString = self.prepareDate(entry.expireDate!)
        let params = ["diligencia_type":entry.type,
                      "description":entry.itemDescription,
                      "location":entry.location,
                      "value": entry.value,
                      "expires_at":expireDateString,] as Dictionary<String, AnyObject>
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Token d8326786c9028d42e8f7d48fe799406f0e2e294e", forHTTPHeaderField: "Authorization")
        do { request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: []) }
        catch { print(error) }
        
        let task = session.dataTaskWithRequest(request, completionHandler: {
            (data, response, error) -> Void in
            if error == nil {
                completion(true)
            }
            else {
                completion(false)
            }
        })
        task.resume()
    }
    
    //MARK: Private
    private func prepareDate(date: NSDate) -> String {
        let dateString = dateFormatter.stringFromDate(date)
        let date = dateFormatter.dateFromString(dateString)! as NSDate
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm"
        let finalDateString = dateFormatter.stringFromDate(date)
        
        return finalDateString
    }
}