//
//  EventClass+CoreDataProperties.swift
//  Registration
//
//  Created by April Hall on 2018-06-13.
//  Copyright © 2018 April Hall. All rights reserved.
//
//

import Foundation
import CoreData


extension EventClass {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventClass> {
        return NSFetchRequest<EventClass>(entityName: "EventClass")
    }

    @NSManaged public var name: String

}
