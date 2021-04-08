//
//  ReviewsForVenueViewController.swift
//  Bite
//
//  Created by Assad Yousuf on 4/6/21.
//

import Foundation
import UIKit

class ReviewsForVenueViewController:UIViewController {
    
    
   
    @IBOutlet weak var ReviewTable: UITableView!
    
    
    override func viewDidLoad() {
        ReviewTable.dataSource = self
        ReviewTable.delegate = self
        ReviewTable.rowHeight = UITableView.automaticDimension
        ReviewTable.rowHeight = 290.0
        
        
}

}


