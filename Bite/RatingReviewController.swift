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
    var selectedVenue:Venue?
    @IBOutlet weak var reviewText: UITextView!
    @IBOutlet weak var Starz: CosmosView!
    @IBOutlet weak var addReview: UIButton!
   
    var mac:NSManagedObjectContext?
    
    
    @IBAction func addReviewToResturant(_ sender: Any) {
        if (reviewText.text != ""){
            let r = review()
            r.rating = Starz.rating
            r.text = reviewText.text
            selectedVenue?.list_of_reviews.append(r)
            
            let entity = NSEntityDescription.entity(forEntityName: "VenueEntity", in: mac!)
            let newVenue = NSManagedObject(entity: entity!, insertInto: mac!)
            newVenue.setValue(selectedVenue?.list_of_reviews, forKey:"list_of_reviews")
            do {
                try mac?.save()
                print("Sucesss Saving")
                
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
