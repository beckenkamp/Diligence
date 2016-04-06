//
//  AddPresenter.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation

class AddPresenter : NSObject, AddModuleInterface, AddInteractorOutput {
    var addInteractor : AddInteractor?
    var addWireframe : AddWireframe?
    var addModuleDelegate : AddModuleDelegate?
    
    //MARK: - Module Interface
    func cancelAddAction() {
        addWireframe?.dismissAddInterface()
        addModuleDelegate?.addModuleDidCancelAddAction()
    }
    
    func saveAddActionWithDescription(description: String, value: Float, date: NSDate) {
        addInteractor?.saveNewEntryWithDescription(description, value: value, date: date)
        addWireframe?.dismissAddInterface()
    }
    
    //MARK: - AddInteractorOutput
    func savedNewEntry() {
        addModuleDelegate?.addModuleDidSaveAddAction()
    }
}