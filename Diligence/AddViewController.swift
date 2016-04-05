//
//  AddViewController.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation
import UIKit

class AddViewController: UIViewController, UITextFieldDelegate, AddViewInterface {
    var eventHandler : AddModuleInterface?
    
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var valueTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    var minimumDate : NSDate = NSDate()
    var transitioningBackgroundView : UIView = UIView()
    
    //MARK: View Life Cycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.configureView()
    }
    
    //MARK: View Interface
    
    @IBAction func save(sender: AnyObject) {
        let value = Double(valueTextField.text!)
        eventHandler?.saveAddActionWithDescription(descriptionTextField.text!, value: value!, date: datePicker.date)
    }
    
    @IBAction func cancel(sender: AnyObject) {
        view.endEditing(true)
        eventHandler?.cancelAddAction()
    }
    
    //MARK: - TextField Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    //MARK: - Private
    
    func configureView() {
        transitioningBackgroundView.userInteractionEnabled = true
        descriptionTextField.delegate = self
        valueTextField.delegate = self
        descriptionTextField.becomeFirstResponder()
        
        if let realDatePicker = datePicker {
            realDatePicker.minimumDate = minimumDate
        }
    }
}