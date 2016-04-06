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
    
    //MARK: - Module Interface
    func updateView() {
        listInteractor?.findItems()
    }
    
    func addNewEntry() {
        listWireframe?.presentAddInterface()
    }
    
    //MARK: - ListInteractorOutput
    func foundItems(items: [DiligenceItem]) {
        userInterface?.displayData(items)
    }
    
    //MARK - AddModuleDelegate
    func addModuleDidSaveAddAction() {
        updateView()
    }
    
    func addModuleDidCancelAddAction() {
        // No action necessary
    }
}