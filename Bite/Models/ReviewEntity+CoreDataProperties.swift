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
    @NSManaged public var ratingText: String?
    @NSManaged public var venueName: String?
    @NSManaged public var ratingNum: Double
    @NSManaged public var profilePic: Data?
    @NSManaged public var venuesThatReviewd: VenueEntity?
    @NSManaged public var usersThatReviewed: UserEntity?

}
