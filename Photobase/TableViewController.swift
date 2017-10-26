 //
//  TableViewController.swift
//  Photobase
//
//  Created by Juan Naputi on 10/24/17.
//  Copyright © 2017 Juan Naputi. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var resultsController = NSFetchedResultsController<NSFetchRequestResult>()
    var persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsController = getFetchedResultsController()
        resultsController.delegate = self
        
        do {
            try resultsController.performFetch()
            self.tableView.reloadData()
        } catch {
            print("Error fetching the data.  \(error.localizedDescription)")
            return
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfRows = resultsController.sections?[section].numberOfObjects {
            return numberOfRows
        }
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = resultsController.object(at: indexPath) as! Item
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        if let titleText = item.titletext {
            cell.cellTitle.text = titleText
        }
        
        if let cellDescription = item.descriptiontext {
            cell.cellDescription.text = cellDescription
        }
        
        if let image = item.image {
            cell.imageView?.image = UIImage(data: image as Data)
        }
        
        return cell
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.reloadData()
    }

}
