//
//  Data.swift
//  Bite
//
//  Created by Assad Yousuf on 4/8/21.
//

import Foundation
import CoreData

struct Venue {
    var name:String?
    var id:String?
    var rating:Float?
    var price:String?
    var is_closed:Bool?
    var distance:Double?
    var address:String?
    var list_of_reviews:[review] = []
    
   // var coordinate:[Double] = []
}


struct User {
    var first_name:String?
    var last_name:String?
    var email:String?
    var username:String?
    var password:String?
    var reviewed_resturants:[review] = []
}


struct review {
    var reviewer:String?
    var resturantName:String?
    var rating:Float?
}

func checkIfUserExists(username:String) {
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    let query = username
    let request:NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
    request.predicate = NSPredicate(format: "name == %@", query)
    
}





