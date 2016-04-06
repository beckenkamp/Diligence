//
//  AddPresentationTransition.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation
import UIKit

class AddPresentationTransition: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.72
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! AddViewController
        
        toVC.transitioningBackgroundView.backgroundColor = UIColor.darkGrayColor()
        toVC.transitioningBackgroundView.alpha = 0.0
        toVC.transitioningBackgroundView.frame = UIScreen.mainScreen().bounds
        
        let containerView = transitionContext.containerView()
        containerView?.addSubview(toVC.transitioningBackgroundView)
        containerView?.addSubview(toVC.view)
        
        let toViewFrame = CGRectMake(0, 0, 260, 350)
        toVC.view.frame = toViewFrame
        
        let finalCenter = CGPointMake(fromVC!.view.bounds.size.width / 2, 20 + toViewFrame.size.height / 2)
        toVC.view.center = CGPointMake(finalCenter.x, finalCenter.y - 1000)
        
        let options = UIViewAnimationOptions.CurveEaseIn
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext),
                                   delay: 0.0,
                                   usingSpringWithDamping: 0.64,
                                   initialSpringVelocity: 0.22,
                                   options: options,
                                   animations: {
                                    toVC.view.center = finalCenter
                                    toVC.transitioningBackgroundView.alpha = 0.7
            },
                                   completion: { finished in
                                    toVC.view.center = finalCenter
                                    transitionContext.completeTransition(true)
            }
        )
    }
}