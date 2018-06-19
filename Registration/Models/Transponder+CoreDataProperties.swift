//
//  Transponder+CoreDataProperties.swift
//  Registration
//
//  Created by April Hall on 2018-06-13.
//  Copyright © 2018 April Hall. All rights reserved.
//
//

import Foundation
import CoreData


extension Transponder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transponder> {
        return NSFetchRequest<Transponder>(entityName: "Transponder")
    }

    @NSManaged public var name: String
    @NSManaged public var code: String

}
