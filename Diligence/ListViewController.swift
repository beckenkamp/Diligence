//
//  ListViewController.swift
//  Diligence
//
//  Created by Maurício Maniglia on 4/3/16.
//  Copyright © 2016 Mauricio Maniglia. All rights reserved.
//

import Foundation
import UIKit

var ListEntryCellIdentifier = "ListEntryCell"

class ListViewController : UITableViewController, ListViewInterface {
    var eventHandler : ListModuleInterface?
    var dataProperty : [DiligenceItem]?
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataProperty = []
        
        configureView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        eventHandler?.updateView()
    }
    
    //MARK: - ListViewInterface
    
    func displayData(data: [DiligenceItem]) {
        dataProperty = data
        reloadEntries()
    }
    
    func reloadEntries() {
        tableView.reloadData()
    }
    
    //MARK: - TableView data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProperty!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let diligence = dataProperty![indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ListEntryCellIdentifier, forIndexPath: indexPath) as! ListEntryCell
        cell.diligence = diligence
                        
        return cell
    }
    
    //MARK: - Private
    
    private func configureView() {
        navigationItem.title = "Diligências"
        
        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(ListViewController.didTapAddButton))
        
        navigationItem.rightBarButtonItem = addItem
    }
    
    @objc private func didTapAddButton () {
        eventHandler?.addNewEntry()
    }
}