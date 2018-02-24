//
//  UICustom.swift
//  ImageViewer
//
//  Created by Pedro Brandão on 24/02/2018.
//  Copyright © 2018 Pedro Brandão. All rights reserved.
//

import UIKit

extension UIViewController {
    private static func findBest(viewController:UIViewController?) -> UIViewController? {
        guard let vc = viewController else {
            return nil
        }
        
        if let presentedVC = vc.presentedViewController {
            return UIViewController.findBest(viewController:presentedVC)
        }
        
        if let svc = vc as? UISplitViewController {
            if svc.viewControllers.count > 0 {
                if let svcLastViewController = svc.viewControllers.last {
                    return UIViewController.findBest(viewController:svcLastViewController)
                }
            } else {
                return vc
            }
        }
        
        if let navController = vc as? UINavigationController {
            if navController.viewControllers.count > 0 {
                if let topNavViewController = navController.topViewController {
                    return UIViewController.findBest(viewController:topNavViewController)
                }
            } else {
                return vc
            }
        }
        
        if let tabVC = vc as? UITabBarController {
            if tabVC.viewControllers!.count > 0 {
                if let tabVCSelectedVC = tabVC.selectedViewController {
                    return UIViewController.findBest(viewController:tabVCSelectedVC)
                }
            }
            return vc
        }
        
        return vc
    }
    
    static func currentViewController() -> UIViewController? {
        let viewController = UIApplication.shared.keyWindow?.rootViewController
        return UIViewController.findBest(viewController: viewController)
    }
}
