//
//  Item+CoreDataClass.swift
//  Photobase
//
//  Created by Juan Naputi on 10/24/17.
//  Copyright © 2017 Juan Naputi. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    
    @NSManaged public var titletext: String?
    @NSManaged public var descriptiontext: String?
    @NSManaged public var image: NSData?
}
