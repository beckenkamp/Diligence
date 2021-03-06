//
//  ListInteractorIO.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation

protocol ListInteractorInput {
    func findItems()
}

protocol ListInteractorOutput {
    func foundItems(items: [DiligenceItem])
}