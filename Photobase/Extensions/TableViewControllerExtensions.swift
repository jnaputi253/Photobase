//
//  TableViewControllerExtensions.swift
//  Photobase
//
//  Created by Juan Naputi on 10/24/17.
//  Copyright © 2017 Juan Naputi. All rights reserved.
//

import UIKit
import CoreData

extension TableViewController : NSFetchedResultsControllerDelegate {
    
    func fetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        let ascendingSortDescriptor = NSSortDescriptor(key: "titletext", ascending: true)
        fetchRequest.sortDescriptors = [ascendingSortDescriptor]
        
        return fetchRequest
    }
    
    func getFetchedResultsController() -> NSFetchedResultsController<NSFetchRequestResult> {
        self.resultsController = NSFetchedResultsController(fetchRequest: self.fetchRequest(), managedObjectContext: self.persistentContainer, sectionNameKeyPath: nil, cacheName: nil)
        
        return self.resultsController
    }
    
}

extension TableViewController : UIImagePickerControllerDelegate {
    
}

extension TableViewController : UINavigationControllerDelegate {
    
}
