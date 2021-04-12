//
//  ReviewsForVenueViewController.swift
//  Bite
//
//  Created by Assad Yousuf on 4/6/21.
//

import Foundation
import UIKit
import CoreData

class ReviewsForVenueViewController:UIViewController {
    
    public var local_resturants:[Venue] = []
   
    @IBOutlet weak var ReviewTable: UITableView!
    var selectedVenue:VenueEntity?
    var mac:NSManagedObjectContext?
    public var currentUser:UserEntity?
    
    
    override func viewDidLoad() {
        ReviewTable.dataSource = self
        ReviewTable.delegate = self
        //ReviewTable.estimatedRowHeight = CustomReviewCell.
        self.ReviewTable.rowHeight = UITableView.automaticDimension;
        self.ReviewTable.estimatedRowHeight = 185.0;
}
    
    override func viewWillAppear(_ animated: Bool) {
        ReviewTable.reloadData()
    }
  
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? RatingReviewController {
            nextVC.selectedVenue = selectedVenue
            nextVC.currentUser = currentUser
            //nextVC.mac = self.mac
            //let managedObjectContext = Persistence.sharedInstance.managedObjectContext

        }
       
    }
    

}


