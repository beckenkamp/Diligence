//
//  AddInteractor.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation

class AddInteractor: NSObject, AddInteractorInput {
    var addDataManager: AddDataManager?
    var output: AddInteractorOutput?
    
    func saveNewEntryWithDescription(description: String, value: Float, date: NSDate){        
        let newEntry = DiligenceItem(type: "http://52.35.220.218/api/types/4/", itemDescription: description, location: "http://52.35.220.218/api/locations/10969/", value: value, expireDate: date, expireDateString: nil)
        
        addDataManager?.addNewEntry(newEntry, completion: { (response) in
            if response == true {
                self.output?.savedNewEntry()
            }
        })
    }
}