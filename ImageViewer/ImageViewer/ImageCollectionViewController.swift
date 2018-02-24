//
//  ImageCollectionViewController.swift
//  ImageViewer
//
//  Created by Pedro Brandão on 30/12/2017.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

import UIKit
import Alamofire
import PopupDialog

final class ImageCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    fileprivate let itemsPerRow: CGFloat = 3
    fileprivate let reuseIdentifier = "ImageCell"
    fileprivate let sectionInsets = UIEdgeInsetsMake(50.0, 20.0, 50.0, 20.0)
    fileprivate var searches = [FlickrSearchResults]()
    fileprivate let flickr = Flickr()
    
    fileprivate var imagens, elementos: Array<Any>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let image = UIImage(named: "foto_perfil")
        let popup = PopupDialog(title: "PopupDialog", message: "Olá do AppDelegate!", image: image)
        let button = DefaultButton(title:"Default Button", dismissOnTap: true) {
            print("\n\nTudo certo!")
        }
        popup.addButton(button)
        self.present(popup, animated: true, completion: nil)
    }
    
    // MARK: Custom
    // print("Response: \(String(describing: response.response))\n")
    // print("Result: \(response.result)\n")
    // print("JSON response: \(String(describing: response.result.value))")
    func loadData() {
        
        let params: Parameters = [
            "feature" : "popular",
            "image_size" : 3,
            "consumer_key" : API.consumerKey
        ]
        
        Alamofire.request(API.url, parameters: params)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    self.handleSuccess(response: response)
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    // Analisa a resposta e atualiza self.elementos caso seja a resposta válida
    func handleSuccess(response: DataResponse<Any>) {
        if let dictionary = response.result.value as? [String: Any] {
            if let photos = dictionary["photos"] as? Array<Any> {
                self.elementos = photos
                print("Encontradas \(photos.count) imagens\n")
                // atualize os dados
                self.updateData()
            }
        }
    }
    
    // Calcula o tamanho e adiciona as imagens.
    // Daria pra fazer
    func updateData() {
        
    }
}

extension ImageCollectionViewController : UICollectionViewDelegateFlowLayout {
    // 1
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let avaliableWidth = view.frame.width - paddingSpace
        let widthPerItem = avaliableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    // 3
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

extension ImageCollectionViewController : UITextFieldDelegate {
    
    // when user hit return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 1
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        textField.addSubview(activityIndicator)
        activityIndicator.frame = textField.bounds
        activityIndicator.startAnimating()
        
        flickr.searchFlickrForTerm(textField.text!) { results, error in
            activityIndicator.removeFromSuperview()
            
            if let error = error {
                // 2
                print("Error searching: \(error)")
                return
            }
            
            if let results = results {
                // 3
                print("Found \(results.searchResults.count) matching \(results.searchTerm)")
                self.searches.insert(results, at: 0)
                
                // 4
                self.collectionView?.reloadData()
            }
        }
        textField.text = nil
        textField.resignFirstResponder()
        return true
    }
}

// MARK: UICollectionViewDataSource
extension ImageCollectionViewController {
    // 1
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return searches.count
    }
    
    // 2
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searches[section].searchResults.count
    }
    
    // 3
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        
        let flickrPhoto = photoForIndexPath(indexPath: indexPath)
        cell.backgroundColor = UIColor.white
        cell.imageView.image = flickrPhoto.thumbnail
        return cell
    }
}

// MARK: Private
private extension ImageCollectionViewController {
    func photoForIndexPath(indexPath: IndexPath) -> FlickrPhoto {
        return searches[(indexPath as NSIndexPath).section].searchResults[(indexPath as IndexPath).row]
    }
}

