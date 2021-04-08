//
//  ViewController.swift
//  Bite
//
//  Created by Assad Yousuf on 3/31/21.
//

import UIKit

class LogInDetailViewController: UIViewController {
    
    //MARK: Declerations
    
    @IBOutlet weak var logInButon: UIButton!
    //
    
    //MARK: Before Page Loads
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        logInButon.layer.cornerRadius = 20
        
    }
    
   
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    
    
    

}


