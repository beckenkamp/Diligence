//
//  ListPresenter.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation

class ListPresenter : NSObject, ListInteractorOutput, ListModuleInterface, AddModuleDelegate {
    var listInteractor : ListInteractorInput?
    var listWireframe : ListWireframe?
    var userInterface : ListViewInterface?
    
    func updateView() {
        listInteractor?.findItems()
    }
    
    func foundItems(items: [DiligenceItem]) {
        userInterface?.displayData(items)
    }
    
    func addNewEntry() {
        listWireframe?.presentAddInterface()
    }
    
    func addModuleDidCancelAddAction() {
        // No action necessary
    }
    
    func addModuleDidSaveAddAction() {        
        updateView()
    }
}