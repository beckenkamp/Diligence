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
    @IBOutlet private weak var type: UILabel!
    @IBOutlet private weak var value: UILabel!
    @IBOutlet private weak var expireDate: UILabel!
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        return nf
    }()
    let dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "YYYY-MM-DDThh:mm"
        return formatter
    }()
    
    var diligence: DiligenceItem? {
        didSet {
            if let diligence = diligence {
                type.text = diligence.type
                //value.text = numberFormatter.stringFromNumber(diligence.value)
                expireDate.text = dateFormatter.stringFromDate(diligence.dateExpires)
            }
        }
    }
}