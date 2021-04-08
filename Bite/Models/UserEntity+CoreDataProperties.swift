//
//  UserEntity+CoreDataProperties.swift
//  
//
//  Created by Assad Yousuf on 4/8/21.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var reviews: NSObject?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var first_name: NSObject?
    @NSManaged public var last_name: NSObject?

}
