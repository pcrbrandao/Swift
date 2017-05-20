//
//  PhotoCommentViewController.swift
//  PhotoScroll
//
//  Created by Pedro Brandão on 18/05/17.
//  Copyright © 2017 raywenderlich. All rights reserved.
//

import UIKit

class PhotoCommentViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameTextField: UITextField!
    
    public var photoName: String!
    public var photoIndex: Int!
    
    @IBAction func hideKeyboard(_ sender: Any) {
        nameTextField.endEditing(true)
    }
    
    @IBAction func openZoomingController(sender: AnyObject) {
        self.performSegue(withIdentifier: "zooming", sender: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func adjustInsetForKeyboardShow(show: Bool, notification: NSNotification) {
        guard let value = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue else {return}
        let keyboardFrame = value.cgRectValue
        let adjustmentHeight = (keyboardFrame.height + 20) * (show ? 1 : -1)
        scrollView.contentInset.bottom += adjustmentHeight
        scrollView.scrollIndicatorInsets.bottom += adjustmentHeight
    }
    
    func keyboardWillShow(notification: NSNotification) {
        adjustInsetForKeyboardShow(show: true, notification: notification)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        adjustInsetForKeyboardShow(show: false, notification: notification)
    }
    
    func addNotifications() {
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(PhotoCommentViewController.keyboardWillShow(notification:)),
            name: NSNotification.Name.UIKeyboardWillShow,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(PhotoCommentViewController.keyboardWillHide(notification:)),
            name: NSNotification.Name.UIKeyboardWillHide,
            object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let photoName = photoName {
            self.imageView.image = UIImage(named: photoName)
        }
        
        addNotifications()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, let zoomedPhotoViewController = segue.destination as? ZoomedPhotoViewController {
            if id == "zooming" {
                zoomedPhotoViewController.photoName = photoName
            }
        }
    }
}
