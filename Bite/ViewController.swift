//
//  ViewController.swift
//  Bite
//
//  Created by Assad Yousuf on 3/31/21.
//

import UIKit
import Cosmos

class ViewController: UIViewController {
    
    //MARK: Declerations
    @IBOutlet weak var BiteLogo: UIImageView!
    @IBOutlet weak var LogInButton: UIButton!
    @IBOutlet weak var CreateAccountButton: UIButton!
    public var currentUser:String?
    //
    
    //MARK: Before Page Loads
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        BiteLogo.image = UIImage(named: "logo.jpg")
        LogInButton.layer.cornerRadius = 30
        CreateAccountButton.layer.cornerRadius = 30
        
        
        
    }
    
    
    
    
    

}

