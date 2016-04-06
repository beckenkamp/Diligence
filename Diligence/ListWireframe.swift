//
//  ListWireframe.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation
import UIKit

let ListViewControllerIdentifier = "ListViewController"

class ListWireframe : NSObject {
    var addWireframe : AddWireframe?
    var listPresenter : ListPresenter?
    var rootWireframe : RootWireframe?
    var listViewController : ListViewController?
    
    //MARK: - Public
    func presentListInterfaceFromWindow(window: UIWindow) {
        let viewController = listViewControllerFromStoryboard()
        viewController.eventHandler = listPresenter
        listViewController = viewController
        listPresenter!.userInterface = viewController
        rootWireframe?.showRootViewController(viewController, inWindow: window)
    }
    
    func presentAddInterface() {
        addWireframe?.presentAddInterfaceFromViewController(listViewController!)
    }
    
    //MARK: - Private
    private func listViewControllerFromStoryboard() -> ListViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(ListViewControllerIdentifier) as! ListViewController
        return viewController
    }
    
    private func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
    
}