//
//  VenueEntity+CoreDataProperties.swift
//  
//
//  Created by Assad Yousuf on 4/10/21.
//
//

import Foundation
import CoreData


extension VenueEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VenueEntity> {
        return NSFetchRequest<VenueEntity>(entityName: "VenueEntity")
    }

    @NSManaged public var address: String?
    @NSManaged public var distance: Double
    @NSManaged public var id: String?
    @NSManaged public var is_closed: Bool
    @NSManaged public var name: String?
    @NSManaged public var price: String?
    @NSManaged public var rating: Double
    @NSManaged public var review_count: Int64
    @NSManaged public var listOfReviews: NSSet?

}

// MARK: Generated accessors for listOfReviews
extension VenueEntity {

    @objc(addListOfReviewsObject:)
    @NSManaged public func addToListOfReviews(_ value: ReviewEntity)

    @objc(removeListOfReviewsObject:)
    @NSManaged public func removeFromListOfReviews(_ value: ReviewEntity)

    @objc(addListOfReviews:)
    @NSManaged public func addToListOfReviews(_ values: NSSet)

    @objc(removeListOfReviews:)
    @NSManaged public func removeFromListOfReviews(_ values: NSSet)

}
