//
//  createAccountViewController.swift
//  Bite
//
//  Created by Assad Yousuf on 4/1/21.
//

import UIKit
import CoreData

class createAccountViewController: UIViewController {
    
    //MARK: Declerations
    var managedObjectContext : NSManagedObjectContext?

    @IBOutlet weak var instructions: UILabel!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    //
    
    //MARK: Before Page Loads
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent {
           
        }
    }
    
    
    @IBAction func createAccount(_ sender: Any) {
      let x =  User.checkIfUsernameExists(username: Username.text!, moc: managedObjectContext)
       
        if firstName.text != "" &&
            lastName.text != "" &&
            Email.text != "" &&
            Username.text != "" &&
            Password.text != "" && x == nil{
            
            
            
            User.delete(moc: managedObjectContext, entity_name: "UserEntity")
           var x = User.addUser(firstName: firstName.text!, lastName: lastName.text!, Email: Email.text!, Username: Username.text!, Password: Password.text!, moc: managedObjectContext)
            firstName.text = ""
            lastName.text = ""
            Email.text = ""
            Username.text = ""
            Password.text = ""
          

        }
        else if x != nil {
            instructions.text = "A user with that username already exists"
        }
        
        else {
            instructions.text = "Please fill out all information. A field is missing"
        }
    }
    
   /* func checkIfUserExists(username:String) -> Bool {
        
        let request:NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
       
        request.predicate = NSPredicate(format: "username == %@", username)
        do {
            try request.execute()
            return true
        } catch {
                return false
        }
    }


     func delete(entity_name:String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity_name)
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try self.managedObjectContext!.execute(batchDeleteRequest)

        } catch {
            // Error Handling
        }
    } */


    
    
    
    
    
    
    
    
    
       
    
    
    
    
    
    
}
