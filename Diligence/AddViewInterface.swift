//
//  AddViewInterface.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation

protocol AddViewInterface {
    func setEntryDescription(name: NSString)
    func setEntryValue(date: NSDecimal)
    func setExpireDate(date: NSDate)
}