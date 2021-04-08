//
//  Delegates.swift
//  Bite
//
//  Created by Assad Yousuf on 4/5/21.
//

import Foundation
import UIKit
import MapKit

extension MapAndTableViewController:UITableViewDelegate, UITableViewDataSource{
    
  
    
    
    //MARK: Before Page Loads
    override func viewDidLoad() {
        super.viewDidLoad()
       locationManager.delegate = self
       locationManager.desiredAccuracy = kCLLocationAccuracyBest
       locationManager.requestWhenInUseAuthorization()
       locationManager.requestLocation()
       table.delegate = self
        table.isScrollEnabled = true
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.name.text = self.local_resturants[indexPath.row].name
        cell.Stars.rating = Double((self.local_resturants[indexPath.row].rating)!)
        cell.Stars.settings.fillMode = .precise
        cell.Stars.settings.updateOnTouch = false
        return cell
       
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return local_resturants.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedVenue = local_resturants[indexPath.row]
        if let viewController = storyboard?.instantiateViewController(identifier: "ReviewsForVenueViewController") as? ReviewsForVenueViewController {
            //viewController.name = selectedVenue.name
            self.navigationController?.show(viewController, sender: self)
        }
    }
    
}




extension MapAndTableViewController : CLLocationManagerDelegate,MKMapViewDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            print("authorized when in Use")
            locationManager.requestLocation()
        }
        else if status == .authorizedAlways {
            print("Location always on")
            locationManager.requestLocation()
        }
        else if status == .notDetermined{
            print("Not determined")
            locationManager.requestLocation()
        }
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("error:: \(error.localizedDescription)")
       }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
        
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("error:: (error)")
    }
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        self.annotateResturants()
        
    }
}

extension ReviewsForVenueViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as! CustomReviewCell
        cell.profilePic.image = UIImage(named: "logo.jpg")
        cell.profilePic.layer.borderWidth = 1
        cell.profilePic.layer.masksToBounds = false
        cell.profilePic.layer.borderColor = UIColor.black.cgColor
        cell.profilePic.layer.cornerRadius = cell.profilePic.frame.height/2
        cell.profilePic.clipsToBounds = true
        cell.profilePic.contentMode = .scaleAspectFill
        
        cell.reviewText.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        cell.reviewName.text = "Assad Yousuf"
        return cell
    }
    
}
