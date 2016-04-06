//
//  AddInteractorIO.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/5/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation

protocol AddInteractorInput {
    func saveNewEntryWithDescription(description: String, value: Float, date: NSDate)
}

protocol AddInteractorOutput {
    func savedNewEntry()
}