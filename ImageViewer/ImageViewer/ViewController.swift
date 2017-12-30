//
//  ViewController.swift
//  ImageViewer
//
//  Created by Pedro Brandão on 29/12/2017.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//
//  Consumer key=7IP7MZF8FLBnwp3XH7E4KKMvcujcOH4tRoMTlLgY

import UIKit
import Alamofire

class ViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: Properties
    @IBOutlet weak var scrollView: UIScrollView!
    var imagens, elementos: Array<Any>!
    
    // MARK: ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
                self.inicializaScroll()
            }
        }
    }
    
    // Calcula o tamanho e adiciona as imagens.
    // Daria pra fazer
    func inicializaScroll() {
        
    }
}
