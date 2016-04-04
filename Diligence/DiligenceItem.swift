//
//  DiligenceItem.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation

class DiligenceItem: NSObject {
    var type: String
    var itemDescription: String
    var location: String
    var value: NSDecimal
    let dateExpires: NSDate
    
    init(type: String, itemDescription: String, location: String, value: NSDecimal, dateExpires: NSDate) {
        self.type = type
        self.itemDescription = itemDescription
        self.location = location
        self.value = value
        self.dateExpires = dateExpires
        
        super.init()
    }
}