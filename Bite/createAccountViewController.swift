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
    var container: NSPersistentContainer!

    //
    
    //MARK: Before Page Loads
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent {
            (self.parent as? ViewController)?.container = container
            
        }
    }
    
       
    
    
    
    
    
    
}
