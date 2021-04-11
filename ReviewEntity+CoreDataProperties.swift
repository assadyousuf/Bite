//
//  ReviewEntity+CoreDataProperties.swift
//  
//
//  Created by Assad Yousuf on 4/10/21.
//
//

import Foundation
import CoreData


extension ReviewEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReviewEntity> {
        return NSFetchRequest<ReviewEntity>(entityName: "ReviewEntity")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var profilePic: Data?
    @NSManaged public var ratingNum: Double
    @NSManaged public var ratingText: String?
    @NSManaged public var venueName: String?
    @NSManaged public var listOfVenuesReviewed: NSSet?

}

// MARK: Generated accessors for listOfVenuesReviewed
extension ReviewEntity {

    @objc(addListOfVenuesReviewedObject:)
    @NSManaged public func addToListOfVenuesReviewed(_ value: VenueEntity)

    @objc(removeListOfVenuesReviewedObject:)
    @NSManaged public func removeFromListOfVenuesReviewed(_ value: VenueEntity)

    @objc(addListOfVenuesReviewed:)
    @NSManaged public func addToListOfVenuesReviewed(_ values: NSSet)

    @objc(removeListOfVenuesReviewed:)
    @NSManaged public func removeFromListOfVenuesReviewed(_ values: NSSet)

}
