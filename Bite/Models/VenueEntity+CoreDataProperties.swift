//
//  VenueEntity+CoreDataProperties.swift
//  
//
//  Created by Assad Yousuf on 4/8/21.
//
//

import Foundation
import CoreData


extension VenueEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VenueEntity> {
        return NSFetchRequest<VenueEntity>(entityName: "VenueEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var rating: Float
    @NSManaged public var price: String?
    @NSManaged public var is_closed: Bool
    @NSManaged public var distance: Double
    @NSManaged public var address: String?
    @NSManaged public var list_of_reviews: NSObject?

}
