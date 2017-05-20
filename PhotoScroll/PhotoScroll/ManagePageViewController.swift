//
//  ManagePageViewController.swift
//  PhotoScroll
//
//  Created by Pedro Brandão on 19/05/17.
//  Copyright © 2017 raywenderlich. All rights reserved.
//

import UIKit

class ManagePageViewController: UIPageViewController {
    
    var photos = ["photo1", "photo2", "photo3", "photo4", "photo5"]
    var currentIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        // 1
        if let viewController = viewPhotoCommentController(index: currentIndex ?? 0) {
            let viewControllers = [viewController]
            // 2
            setViewControllers(
                viewControllers,
                direction: .forward,
                animated: false,
                completion: nil)
        }
    }
    
    func viewPhotoCommentController(index: Int) -> PhotoCommentViewController? {
        if let storyboard = storyboard,
            let page = storyboard.instantiateViewController(withIdentifier: "PhotoCommentViewController")
                as? PhotoCommentViewController {
            page.photoName = photos[index]
            page.photoIndex = index
            return page
        }
        return nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UIPageControl
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return photos.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex ?? 0
    }
}

// MARK: implementação de UIPageViewControllerDataSource
extension ManagePageViewController: UIPageViewControllerDataSource {
    // 1
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? PhotoCommentViewController {
            var index = viewController.photoIndex
            guard index != NSNotFound && index != 0 else { return nil }
            index = index! - 1
            return viewPhotoCommentController(index: index!)
        }
        return nil
    }
    
    // 2
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? PhotoCommentViewController {
            var index = viewController.photoIndex
            guard index != NSNotFound else { return nil }
            index = index! + 1
            guard index != photos.count else { return nil }
            return viewPhotoCommentController(index: index!)
        }
        return nil
    }
}
