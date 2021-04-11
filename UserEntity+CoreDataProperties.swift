//
//  UserEntity+CoreDataProperties.swift
//  
//
//  Created by Assad Yousuf on 4/10/21.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var email: String?
    @NSManaged public var first_name: String?
    @NSManaged public var last_name: String?
    @NSManaged public var password: String?
    @NSManaged public var reviews: NSObject?
    @NSManaged public var username: String?
    @NSManaged public var profilePicture: Data?
    @NSManaged public var reviews_given: NSSet?

}

// MARK: Generated accessors for reviews_given
extension UserEntity {

    @objc(addReviews_givenObject:)
    @NSManaged public func addToReviews_given(_ value: ReviewEntity)

    @objc(removeReviews_givenObject:)
    @NSManaged public func removeFromReviews_given(_ value: ReviewEntity)

    @objc(addReviews_given:)
    @NSManaged public func addToReviews_given(_ values: NSSet)

    @objc(removeReviews_given:)
    @NSManaged public func removeFromReviews_given(_ values: NSSet)

}
