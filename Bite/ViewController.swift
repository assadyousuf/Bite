//
//  ViewController.swift
//  Bite
//
//  Created by Assad Yousuf on 3/31/21.
//

import UIKit
import Cosmos
import CoreData

class ViewController: UIViewController {
    
    //MARK: Declerations
    @IBOutlet weak var BiteLogo: UIImageView!
    @IBOutlet weak var LogInButton: UIButton!
    @IBOutlet weak var CreateAccountButton: UIButton!
    public var currentUser:String?
    
    var container: NSPersistentContainer!
    
    
    //MARK: Before Page Loads
    override func viewDidLoad() {
        
       // DatabaseManager.delete(entity_name: "ReviewEntity")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        BiteLogo.image = UIImage(named: "logo.jpg")
        LogInButton.layer.cornerRadius = 30
        CreateAccountButton.layer.cornerRadius = 30
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        container = appDelegate.persistentContainer
       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? createAccountViewController {
            nextVC.managedObjectContext = container.viewContext
        }
        else if let nextVC = segue.destination as? LogInDetailViewController {
            nextVC.moc = container.viewContext
            
        }
    }
}
    
    
    class DatabaseManager {
        static let context: NSManagedObjectContext = {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.persistentContainer.viewContext
        }()
        
       static func addUser(firstName:String, lastName:String, Email:String,Username:String,Password:String) {
            let entity = NSEntityDescription.entity(forEntityName: "UserEntity", in: self.context)
        let newUser = NSManagedObject(entity: entity!, insertInto: self.context)
                newUser.setValue(firstName, forKey: "first_name")
                newUser.setValue(lastName, forKey: "last_name")
                newUser.setValue(Email, forKey: "email")
                newUser.setValue(Username, forKey: "username")
                newUser.setValue(Password, forKey: "password")
                let image = UIImage(named: "logo.jpg")
                let data = image!.pngData()
                newUser.setValue(data, forKey: "profilePic")
        
                
               
                do {
                    try self.context.save()
                    print("Sucesss Saving")
                } catch {
                    print("Failed Saving")
                }
            }
    
        
    
    static func findUsername(Username:String) -> UserEntity? {
        let request:NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
              
               request.predicate = NSPredicate(format: "username == %@", Username)
               var results: [UserEntity]?
               do {
                try results = self.context.fetch(request)
                   print("Sucess")
                   if results?.isEmpty == false{
                    if let x = results   {
                        return x[0] }
                   }
               } catch {
                   print("Fail to find user")
               }
               
               return nil
    }
        
        
        static func findPassword(Password:String) -> UserEntity? {
            let request:NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
                  
                   request.predicate = NSPredicate(format: "password == %@", Password)
                   var results: [UserEntity]?
                   do {
                    try results = self.context.fetch(request)
                       print("Sucess")
                       if results?.isEmpty == false{
                        if let x = results   {
                            return x[0] }
                       }
                   } catch {
                       print("Fail to find user")
                   }
                   
                   return nil
        }
        
        
        static func findAccount(Username: String, Password:String)->Bool {
            let x = self.findUsername(Username: Username)
            let y = self.findPassword(Password: Password)
            
            if x != nil && y != nil {
                return true
            } else {
                return false
            }
        }
        
        
        static func findVenue(Name:String) -> VenueEntity? {
            let request:NSFetchRequest<VenueEntity> = VenueEntity.fetchRequest()
                  
                   request.predicate = NSPredicate(format: "name == %@", Name)
                   var results: [VenueEntity]?
                   do {
                    try results = self.context.fetch(request)
                       print("Sucess")
                       if results?.isEmpty == false{
                        if let x = results   {
                            return x[0] }
                       }
                   } catch {
                       print("Fail to find user")
                   }
                   
                   return nil
        }
        
        
        static func findReview(Name:String) -> ReviewEntity? {
            let request:NSFetchRequest<ReviewEntity> = ReviewEntity.fetchRequest()
                  
                   request.predicate = NSPredicate(format: "venueName == %@", Name)
                   var results: [ReviewEntity]?
                   do {
                    try results = self.context.fetch(request)
                       print("Sucess")
                       if results?.isEmpty == false{
                        if let x = results   {
                            return x[0] }
                       }
                   } catch {
                       print("Fail to find user")
                   }
                   
                   return nil
        }
        
        
        
        
        static func delete(entity_name:String){
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity_name)
                    
                    // Create Batch Delete Request
                    let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

                    do {
                        try self.context.execute(batchDeleteRequest)
                        try self.context.save()
                        

                    } catch {
                        print("Fail in delete")
                        // Error Handling
                    }
        }
    
        
        
        
        
        
    
        
    
        
    
    
}






