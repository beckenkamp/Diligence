//
//  AddViewController.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation
import UIKit

class AddViewController: UIViewController {
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var valueTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    var minimumDate : NSDate = NSDate()
    var transitioningBackgroundView : UIView = UIView()
    
    @IBAction func save(sender: AnyObject) {
        
    }
    
    @IBAction func cancel(sender: AnyObject) {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let gestureRecognizer = UITapGestureRecognizer()
        gestureRecognizer.addTarget(self, action: Selector("dismiss"))
        
        transitioningBackgroundView.userInteractionEnabled = true
        
        descriptionTextField.becomeFirstResponder()
        
        if let realDatePicker = datePicker {
            realDatePicker.minimumDate = minimumDate
        }
    }
}