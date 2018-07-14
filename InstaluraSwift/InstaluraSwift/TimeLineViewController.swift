//
//  ViewController.swift
//  InstaluraSwift
//
//  Created by Pedro Brandão on 01/07/2018.
//  Copyright © 2018 Pedro Brandão. All rights reserved.
//

import UIKit
import ReSwift

class TimeLineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, StoreSubscriber {
    
    let cellIdentifier = "postCell"
    var fotos = [String]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fotos = mainStore.state.fotos
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mainStore.unsubscribe(self)
    }
    
    // MARK: TableViewDelegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fotos.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = self.fotos[indexPath.row]
        
        return cell;
    }
    
    // MARK: StoreSubscriber
    func newState(state: TimeLineState) {
        self.fotos = state.fotos
        self.tableView.reloadData()
    }
}

