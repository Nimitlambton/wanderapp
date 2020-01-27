//
//  Mapdesc+CoreDataProperties.swift
//  wander_app
//
//  Created by MacStudent on 2020-01-27.
//  Copyright © 2020 MacStudent. All rights reserved.
//
//

import Foundation
import CoreData


extension Mapdesc {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mapdesc> {
        return NSFetchRequest<Mapdesc>(entityName: "Mapdesc")
    }

    @NSManaged public var long: Double
    @NSManaged public var lat: Double
    @NSManaged public var locationtitle: String?
    @NSManaged public var locationsubtitile: String?

}
