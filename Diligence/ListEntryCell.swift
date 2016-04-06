//
//  ListEntryCell.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/4/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation
import UIKit

class ListEntryCell: UITableViewCell {
    @IBOutlet  weak var typeLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var expireDateLabel: UILabel!
    
    var diligence: DiligenceItem? {
        didSet {
            if let diligence = diligence {
                typeLabel.text = diligence.type
                descriptionLabel.text = diligence.itemDescription                
                valueLabel.text = "\(diligence.value)"
                expireDateLabel.text = diligence.expireDateString
            }
        }
    }
}