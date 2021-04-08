//
//  CustomCell.swift
//  Bite
//
//  Created by Assad Yousuf on 4/6/21.
//

import Foundation
import UIKit
class CustomCell:UITableViewCell{
    
    @IBOutlet weak var Stars: CosmosView!
    @IBOutlet weak var name: UILabel!
    
    
}

class CustomReviewCell:UITableViewCell {
    
    //MARK:Declarations
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var reviewText: UITextView!
    @IBOutlet weak var reviewName: UILabel!
    @IBOutlet weak var reviewRating: CosmosView!
    
    
    
}

