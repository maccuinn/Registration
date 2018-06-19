//
//  Driver+CoreDataProperties.swift
//  Registration
//
//  Created by April Hall on 2018-06-13.
//  Copyright © 2018 April Hall. All rights reserved.
//
//

import Foundation
import CoreData


extension Driver {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Driver> {
        return NSFetchRequest<Driver>(entityName: "Driver")
    }

    @NSManaged public var firstName: String
    @NSManaged public var lastName: String
    @NSManaged public var birthDate: NSDate
    @NSManaged public var memberNumber: String
    @NSManaged public var phoneNumber: String
    @NSManaged public var email: String?
    @NSManaged public var handler: Handler?
    @NSManaged public var cars: NSSet?

}

// MARK: Generated accessors for cars
extension Driver {

    @objc(addCarsObject:)
    @NSManaged public func addToCars(_ value: Car)

    @objc(removeCarsObject:)
    @NSManaged public func removeFromCars(_ value: Car)

    @objc(addCars:)
    @NSManaged public func addToCars(_ values: NSSet)

    @objc(removeCars:)
    @NSManaged public func removeFromCars(_ values: NSSet)

}
