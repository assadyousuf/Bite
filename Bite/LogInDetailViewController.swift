//
//  ViewController.swift
//  Bite
//
//  Created by Assad Yousuf on 3/31/21.
//

import UIKit
import CoreData

class LogInDetailViewController: UIViewController {
    
    //MARK: Declerations
    
    @IBOutlet weak var logInButon: UIButton!
    var moc : NSManagedObjectContext?
    //
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    //MARK: Before Page Loads
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        logInButon.layer.cornerRadius = 20
        
    }
    
   

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    if identifier == "LoginToMap" {
        let x = User.checkIfUsernameExists(username: usernameField.text!, moc: self.moc)
        let y = User.checkIfPasswordExists(username: passwordField.text!, moc: self.moc)
        if usernameField.text != "" && passwordField.text != "" && x != nil  && y != nil{
            return true
        } else {
            instructionLabel.text = "User with that username does not exist"
            
        }
    }
    return false
    
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? MapAndTableViewController {
            nextVC.mag = moc
        }
    }
    
    
    

}


