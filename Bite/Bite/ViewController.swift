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
        guard container != nil else {
                   fatalError("This view needs a persistent container.")
               }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? createAccountViewController {
            nextVC.container = container
        }
    }
    
}






