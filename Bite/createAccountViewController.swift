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
    
    //
    
    //MARK: Before Page Loads
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "UserEntity", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
    }
    
       
    
    
    
    
    
    
}
