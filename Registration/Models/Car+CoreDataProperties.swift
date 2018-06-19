//
//  Car+CoreDataProperties.swift
//  Registration
//
//  Created by April Hall on 2018-06-13.
//  Copyright © 2018 April Hall. All rights reserved.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var name: String
    @NSManaged public var driver: Driver?
    @NSManaged public var transponder: Transponder?

}
