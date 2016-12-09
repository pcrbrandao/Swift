//
//  GuestBookController.swift
//  GuestBookClient
//
//  Created by Pedro Brandão on 02/12/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import AlamofireObjectMapper
import Alamofire
import HTTPStatusCodes
import ObjectMapper

/**
 * @brief Utiliza os webservices e retorna o resultado para os view controllers
 */
class GuestBookController: NSObject {
    
    let serviceURL = "http://localhost:3000/guestbook"
    private var guestBookResponse: Mappable?
    var guestBooks = [GuestBook]()
    
    static let sharedController = GuestBookController()
    
    // MARK: webservices
    func addEntry(email:String, title:String, content:String, withView view:UIViewController) {
        
        if dadosValidos(strings: [email, title, content]) {
            
            let id = self.guestBooks.count
            
            let guestBook = GuestBook(id:id, email: email, title: title, content: content)
            let parameters: Parameters = guestBook.toDic()
            print("Os parâmetros são.....\(parameters)")
            
            // chamando o webservice
            Alamofire.request(serviceURL, method:.post, parameters: parameters, encoding: JSONEncoding.default).response { response in
                
                let code = (response.response?.statusCode)!
                
                if code == HTTPStatusCode.ok.rawValue {
                    self.guestBooks.append(guestBook)
                    print("registro adicionado...: \(guestBook.toString())")
                    
                    self.alerta(titulo: "Registro adicionado", mensagem: "Registro adicionado com sucesso!", withView:view)
                } else {
                    self.alerta(titulo: "Erro adicionando", mensagem: "Houve uma falha tentando adicionar um registro", withView:view)
                }
            }
        } else {
            self.alerta(titulo: "Dados inválidos", mensagem: "Valores não podem ser nulos",withView:view)
        }
    }
    
    // precisa de teste
    // obtem um array como resposta
    func loadGuestBooks(withView view:GuestBooksViewController) {
        
        Alamofire.request(serviceURL).responseArray { (response: DataResponse<[GuestBook]>) in
            
            if let guestBooksResponse = response.result.value {
                for guest in guestBooksResponse {
                    print("registro carregado.....\(guest.toString())")
                }
                self.guestBooks = guestBooksResponse
                view.tableView.reloadData()
            }
        }
    }
    
    // MARK: métodos auxiliares
    // testa campos
    func dadosValidos(strings: [String]) -> Bool {
        
        if strings.count <= 0 {
            return false
        }
        
        for string in strings {
            if string.campoValido != true {
                return false
            }
        }
        return true
    }
    
    // exibe um alerta com ok
    func alerta(titulo: String, mensagem: String, withView view:UIViewController) {
        
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: UIAlertControllerStyle.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
        // let DestructiveAction = UIAlertAction(title: "Destructive", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
        //    print("Destructive")
        // }
        // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            let _ = view.navigationController?.popViewController(animated: true)
        }
        // alertController.addAction(DestructiveAction)
        alertController.addAction(okAction)
        view.present(alertController, animated: true, completion: nil)
    }
}

class GuestBookResponse: Mappable {
    
    // a lista de Guest Books registrados
    var guestBooks = [GuestBook]()
    
    // MARK: obrigatório para o ObjectMapper
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        guestBooks <- map["guest_books"]
    }
}

extension String {
    var campoValido: Bool {
        let count = self.characters.count
        if count <= 0 || count > 40 {
            return false
        } else {
            return true
        }
    }
}
