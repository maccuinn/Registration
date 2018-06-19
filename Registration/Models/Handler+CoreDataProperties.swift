//
//  Handler+CoreDataProperties.swift
//  Registration
//
//  Created by April Hall on 2018-06-13.
//  Copyright © 2018 April Hall. All rights reserved.
//
//

import Foundation
import CoreData


extension Handler {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Handler> {
        return NSFetchRequest<Handler>(entityName: "Handler")
    }

    @NSManaged public var firstName: String
    @NSManaged public var lastName: String
    @NSManaged public var birthDate: NSDate
    @NSManaged public var memberNumber: String
    @NSManaged public var phoneNumber: String
    @NSManaged public var email: String?

}
