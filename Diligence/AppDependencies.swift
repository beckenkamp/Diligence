//
//  AppDependencies.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
    var listWireframe = ListWireframe()
    
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(window: UIWindow) {
        listWireframe.presentListInterfaceFromWindow(window)
    }
    
    func configureDependencies() {
        let rootWireframe = RootWireframe()
        
        let listPresenter = ListPresenter()
        let listDataManager = ListDataManager()
        let listInteractor = ListInteractor(dataManager: listDataManager)
        
        let addWireframe = AddWireframe()
        let addInteractor = AddInteractor()
        let addPresenter = AddPresenter()
        let addDataManager = AddDataManager()
        
        listInteractor.output = listPresenter
        listPresenter.listInteractor = listInteractor
        listPresenter.listWireframe = listWireframe
        listWireframe.addWireframe = addWireframe
        listWireframe.listPresenter = listPresenter
        listWireframe.rootWireframe = rootWireframe                
        
        addInteractor.output = addPresenter
        addInteractor.addDataManager = addDataManager
        addWireframe.addPresenter = addPresenter
        addPresenter.addWireframe = addWireframe
        addPresenter.addModuleDelegate = listPresenter
        addPresenter.addInteractor = addInteractor
    }
}
