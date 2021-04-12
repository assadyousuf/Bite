//
//  myProfileViewController.swift
//  Bite
//
//  Created by Assad Yousuf on 4/6/21.
//

import Foundation
import UIKit

class myProfileViewController: UIViewController{
 
    @IBOutlet weak var profileImage: UIImageView!
    var currentUser:UserEntity?
    @IBOutlet weak var editImageButton: UIButton!
    
    @IBOutlet weak var saveChangesButton: UIButton!
    
    @IBOutlet weak var firstName: UITextField!
    
    
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editImageButton.layer.cornerRadius = 20
        var getuserpic:UserEntity? = DatabaseManager.findUsername(Username: (currentUser?.username!)!)
        profileImage.image = UIImage(data: (getuserpic?.profilePicture)!)
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFill
    }
    
    @IBAction func selectPhotoPressed(_ sender: Any) {
        let imagePickerVC = UIImagePickerController()
            imagePickerVC.delegate = self
            imagePickerVC.sourceType = .photoLibrary
            present(imagePickerVC, animated: true)
    }
    
    
    
    @IBAction func saveChanges(_ sender: Any) {
        if firstName.text != "" {
            currentUser?.first_name = firstName.text
            firstName.text = ""
        }
        if lastName.text != "" {
            currentUser?.last_name = lastName.text
            lastName.text = ""
        }
        if email.text != ""{
            currentUser?.email = email.text
            email.text = ""
        }
        if username.text != ""{
            currentUser?.username = username.text
            username.text = ""
        }
        if password.text != ""{
            currentUser?.password = password.text
            password.text = ""
        }
        do { try DatabaseManager.context.save() }
         catch{ print("Error in saving picture") }
        
        
        
        
        
        
    }
    
    
    
    
    
   

}


extension myProfileViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)

        if let image = info[.originalImage] as? UIImage {
           // image.c
            profileImage.image = image
            profileImage.layer.cornerRadius = profileImage.frame.height/2
            profileImage.contentMode = .scaleAspectFill
            currentUser?.profilePicture = image.pngData()
           do { try DatabaseManager.context.save() }
            catch{ print("Error in picture picker") }
        }
    }
}
