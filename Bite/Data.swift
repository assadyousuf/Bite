//
//  Data.swift
//  Bite
//
//  Created by Assad Yousuf on 4/8/21.
//

import Foundation
import CoreData




 class Venue {
    var name:String?
    var id:String?
    var rating:Float?
    var price:String?
    var is_closed:Bool?
    var distance:Double?
    var address:String?
    var list_of_reviews:[review] = []
    
    class func saveResturant( name:String,id:String,rating:Float,price:String,is_closed:Bool,distance:Double,address:String, list_of_reviews:[review], moc: NSManagedObjectContext? ) -> Bool {
        let entity = NSEntityDescription.entity(forEntityName: "VenueEntity", in: moc!)
        let newVenue = NSManagedObject(entity: entity!, insertInto: moc!)
        newVenue.setValue(name, forKey: "name")
        newVenue.setValue(id, forKey: "id")
        newVenue.setValue(rating, forKey: "rating")
        newVenue.setValue(price, forKey: "price")
        newVenue.setValue(is_closed, forKey: "is_closed")
        newVenue.setValue(distance, forKey: "distance")
        newVenue.setValue(list_of_reviews, forKey:"list_of_reviews")
        do {
            try moc?.save()
            print("Sucesss Saving")
            return true
        } catch {
            print("Failed Saving")
            return false
        }
    }
    
    
    class func LoadData(moc: NSManagedObjectContext?) -> [VenueEntity]? {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "VenueEntity")
                
                request.returnsObjectsAsFaults = false
                do {
                    let result = try moc?.fetch(request) as! [VenueEntity]
                    return result
                    
                } catch {
                    
                    print("Failed")
                }
    
               return nil
        
    }
    
    
    
 }



 class User {
    var first_name:String?
    var last_name:String?
    var email:String?
    var username:String?
    var password:String?
    
    
    
    class func checkIfUsernameExists(username:String, moc: NSManagedObjectContext?) -> [UserEntity]? {
        
        let request:NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
       
        request.predicate = NSPredicate(format: "username == %@", username)
        var results: [UserEntity]?
        do {
            try results = moc?.fetch(request)
            print("Sucess")
            if results?.isEmpty == false  { return results }
        } catch {
            print("Fail in checkIfUserExists")
            
        }
        
        return nil
    }
    
    class func checkIfPasswordExists(username:String, moc: NSManagedObjectContext?) -> [UserEntity]? {
        
        let request:NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
       
        request.predicate = NSPredicate(format: "password == %@", username)
        var results: [UserEntity]?
        do {
            try results = moc?.fetch(request)
            print("Sucess")
            if results?.isEmpty == false  { return results }
        } catch {
            print("Fail in checkIfUserExists")
            
        }
        
        return nil
    }


     class func delete(moc: NSManagedObjectContext?, entity_name:String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity_name)
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try moc?.execute(batchDeleteRequest)
            try moc?.save()
            

        } catch {
            print("Fail in delete")
            // Error Handling
        }
    }
    
    class func addUser(firstName:String, lastName:String, Email:String,Username:String,Password:String, moc: NSManagedObjectContext?) -> Bool {
        let entity = NSEntityDescription.entity(forEntityName: "UserEntity", in: moc!)
        let newUser = NSManagedObject(entity: entity!, insertInto: moc!)
        newUser.setValue(firstName, forKey: "first_name")
        newUser.setValue(lastName, forKey: "last_name")
        newUser.setValue(Email, forKey: "email")
        newUser.setValue(Username, forKey: "username")
        newUser.setValue(Password, forKey: "password")
        do {
            try moc?.save()
            print("Sucesss Saving")
            return true
        } catch {
            print("Failed Saving")
            return false
        }
    }
    
}


 class review {
    var reviewer:String?
    var resturantName:String?
    var text:String?
    var rating:Double?
}








 

