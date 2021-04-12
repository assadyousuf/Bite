//
//  RatingReviewController.swift
//  Bite
//
//  Created by Assad Yousuf on 4/9/21.
//

import Foundation
import UIKit
import CoreData

class RatingReviewController:UIViewController{
    
    @IBOutlet weak var instructionLabel: UILabel!
    var selectedVenue:VenueEntity?
    @IBOutlet weak var reviewText: UITextView!
    @IBOutlet weak var Starz: CosmosView!
    @IBOutlet weak var addReview: UIButton!
   
    var currentUser:UserEntity?
    
    
    @IBAction func addReviewToResturant(_ sender: Any) {
        if (reviewText.text != ""){
            
            let r = ReviewEntity(context: DatabaseManager.context)
            r.ratingNum = Starz.rating
            r.ratingText = reviewText.text
            r.venueName = selectedVenue?.name
            r.fullName = (currentUser?.first_name)! + " " +  (currentUser?.last_name)!
            selectedVenue?.addToListOfReviews(r)
            r.addToListOfVenuesReviewed(selectedVenue!)
            
           
            
            try! DatabaseManager.context.save()
            
            
            do {
                try DatabaseManager.context.save()
                print("Sucesss Saving Rating ")
                print(selectedVenue?.listOfReviews?.count)
                
            } catch {
                print("Failed Saving")
               
            }
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent {
            (self.parent as? ReviewsForVenueViewController)?.ReviewTable.reloadData()
        }
    }
}
