//
//  ImageCollectionViewController.swift
//  ImageViewer
//
//  Created by Pedro Brandão on 30/12/2017.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

import UIKit
import Alamofire

final class ImageCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    fileprivate let reuseIdentifier = "ImageCell"
    fileprivate let sectionInsets = UIEdgeInsetsMake(50.0, 20.0, 50.0, 20.0)
    fileprivate var searches = [FlickrSearchResults]()
    fileprivate let flickr = Flickr()
    
    fileprivate var imagens, elementos: Array<Any>!
    
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

// MARK: Private
private extension ImageCollectionViewController {
    func photoForIndexPath(indexPath: IndexPath) -> FlickrPhoto {
        return searches[(indexPath as NSIndexPath).section].searchResults[(indexPath as IndexPath).row]
    }
}

