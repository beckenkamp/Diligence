//
//  ClientAPI.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation

enum Method: String {
    case diligences = "/diligencias/mine/"
}

enum DiligenceResult {
    case Success([DiligenceItem])
    case Failure(ErrorType)
}

enum ClientError: ErrorType {
    case InvalidJSONData
}

struct ClientAPI {
    private static let baseURLString = "http://52.35.220.218/api"
    private static let dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "YYYY-MM-DDThh:mm"
        return formatter
    }()
    
    private static func clientURL(method method: Method) -> NSURL {
        let urlString = baseURLString + method.rawValue
        let url = NSURL(string: urlString)
        
        return url!
    }
    
    static func diligences() -> NSURL {
        return clientURL(method: .diligences)
    }
    
    static func diligencesFromJSONData(data: NSData) -> DiligenceResult {
        do {
            let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: [])
            print(jsonObject)
            
            guard let
                jsonDictionary = jsonObject as? [NSObject:AnyObject],
                diligencesArray = jsonDictionary["results"] as? [[String:AnyObject]]
                else {
                    //The json structure doesn't match our expectation
                    return .Failure(ClientError.InvalidJSONData)
            }
            
            var finalDiligences = [DiligenceItem]()
            for diligenceJSON in diligencesArray {
                if let diligence = diligenceFromJSONObject(diligenceJSON) {
                    finalDiligences.append(diligence)
                }
            }
            
            if finalDiligences.count == 0 && diligencesArray.count > 0 {
                //We weren't able to parse any of the diligences
                //Maybe the json format for diligences has changed
                return .Failure(ClientError.InvalidJSONData)
            }
            
            return .Success(finalDiligences)
        }
        catch let error {
            return .Failure(error)
        }
    }
    
    private static func diligenceFromJSONObject(json: [String: AnyObject]) -> DiligenceItem? {
        guard let
            type            = json["diligencia_type"] as? String,
            itemDescription = json["description"] as? String,
            location        = json["location"] as? String,
            value           = json["value"] as? NSDecimal,
            dateString      = json["expires_at"] as? String,
            expireDate      = dateFormatter.dateFromString(dateString)
            else {
                //Don't have enough information to build a Diligence
                return nil
        }
        
        let diligence = DiligenceItem(type: type, itemDescription: itemDescription, location: location, value: value, dateExpires: expireDate)
        
        return diligence
    }

}