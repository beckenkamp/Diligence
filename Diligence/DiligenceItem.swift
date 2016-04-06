//
//  DiligenceItem.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation

struct DiligenceItem {
    let type: String
    let itemDescription: String
    let location: String
    let value: Float
    var expireDate: NSDate?
    var expireDateString: String?
    
    init(type: String, itemDescription: String, location: String, value: Float, expireDate: NSDate?, expireDateString: String?) {
        self.type = type
        self.itemDescription = itemDescription
        self.location = location
        self.value = value
        self.expireDate = expireDate
        self.expireDateString = expireDateString
    }
}