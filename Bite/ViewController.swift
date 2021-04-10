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






