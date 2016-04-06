//
//  AddWireframe.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation
import UIKit

let AddViewControllerIdentifier = "AddViewController"

class AddWireframe : NSObject, UIViewControllerTransitioningDelegate {
    
    var addPresenter : AddPresenter?
    var presentedViewController : UIViewController?
    
    //MARK: - Public
    func presentAddInterfaceFromViewController(viewController: UIViewController) {
        let newViewController = addViewController()
        newViewController.eventHandler = addPresenter
        newViewController.modalPresentationStyle = .Custom
        newViewController.transitioningDelegate = self
        
        viewController.presentViewController(newViewController, animated: true, completion: nil)
        
        presentedViewController = newViewController
    }
    
    func dismissAddInterface() {
        presentedViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AddDismissalTransition()
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AddPresentationTransition()
    }
    
    //MARK: - Private
    private func addViewController() -> AddViewController {
        let storyboard = mainStoryboard()
        let addViewController: AddViewController = storyboard.instantiateViewControllerWithIdentifier(AddViewControllerIdentifier) as! AddViewController
        return addViewController
    }
    
    private func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
}