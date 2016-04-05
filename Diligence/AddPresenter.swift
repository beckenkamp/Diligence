//
//  AddPresenter.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation

class AddPresenter : NSObject, AddModuleInterface {
    //var addInteractor : AddInteractor?
    var addWireframe : AddWireframe?
    var addModuleDelegate : AddModuleDelegate?
    
    //MARK: Module Interface
    func cancelAddAction() {
        addWireframe?.dismissAddInterface()
        addModuleDelegate?.addModuleDidCancelAddAction()
    }
    
    func saveAddActionWithDescription(description: NSString, value: Double, date: NSDate) {
        //addInteractor?.saveNewEntryWithName(name, dueDate: dueDate);
        addWireframe?.dismissAddInterface()
        addModuleDelegate?.addModuleDidSaveAddAction()
    }
}