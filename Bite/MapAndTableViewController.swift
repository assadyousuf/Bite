//
//  MapAndTableViewController.swift
//  Bite
//
//  Created by Assad Yousuf on 4/4/21.
//

import Foundation
import UIKit
import MapKit
import CoreData

class MapAndTableViewController: UIViewController {
    
    //MARK: Declerations
    
    @IBOutlet weak var naviagtionItem: UINavigationItem!
    
    public var local_resturants:[VenueEntity] = []
    var mag : NSManagedObjectContext?
    var currentUser:UserEntity?
   
    
    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var mapView: MKMapView!
    var resultSearchController:UISearchController? = nil
    //
    let locationManager = CLLocationManager()
  
  
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            (self.parent as? LogInDetailViewController)?.currentUser = currentUser
        }
    }
     
    
    
    func loadLocalResturantRatings(){
      let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ReviewEntity")
        do {
            let result = try DatabaseManager.context.fetch(request) as! [ReviewEntity]
            
            for i in result {
                for j in local_resturants{
                    if j.name == i.venueName {
                       // j.rating = (i.ratingNum + j.rating ) / Double(j.review_count-1)
                        j.rating = ((Double(j.review_count)-1.0) * j.rating) + i.ratingNum
                        j.rating = j.rating / Double(j.review_count)
                        j.listOfReviews = result                    }
                }
            }
        } catch {
            print("Loading venues failed")
        }
        
        
    
    }
    
    
    
  
    func annotateResturants() {
        let lat = self.locationManager.location?.coordinate.latitude ?? 0
        let long = self.locationManager.location?.coordinate.longitude ?? 0
        self.fetchYelpData(latitude: lat, longitude: long, completionHandler:{  jsonPayload, error in
            if let jsonPayload = jsonPayload {
                self.local_resturants = jsonPayload
                
            }
            DispatchQueue.main.async {
                self.table.reloadData()
                for r in self.local_resturants {
                    if let name_ = r.name, let address_ = r.address {
                        self.geoCoder(address: address_, name:name_)
                      //  User.delete(moc: self.mag, entity_name: "VenueEntity")
                      //  self.loadLocalResturantReviews()
                        
                        
                    }
                    
                }
               
                self.loadLocalResturantRatings()
            }
        }
            )
    }
    
    
    
    
    func geoCoder(address: String, name:String){
        let geoCoder = CLGeocoder();
        //let addressString = "699, S. Mill Ave, Tempe, AZ, 85281"
        let addressString = address
        CLGeocoder().geocodeAddressString(addressString, completionHandler:
            {(placemarks, error) in
                
                if error != nil {
                    print("Geocode failed: \(error!.localizedDescription)")
                } else if placemarks!.count > 0 {
                    let placemark = placemarks![0]
                    let location = placemark.location
                    let coords = location!.coordinate
                    print(location)
                   
    
                    let ani = MKPointAnnotation()
                    ani.coordinate = placemark.location!.coordinate
                    ani.title = name
                    ani.subtitle = placemark.subLocality
                    
                    self.mapView.addAnnotation(ani)
                    
                   
                }
        })
    }
        
    
    
func fetchYelpData(latitude: Double,longitude: Double, completionHandler: @escaping ([VenueEntity]?, Error?) -> Void) {
        
        
        // MARK: Retrieve venues from Yelp API
        let apikey = "cNptfat6AjjU3uUM-Cj7sLhAOwcBmcoAp6S3r0DK5VYzxYqxRWP49qY_J_Qy01D8gCYF2M8SiVkkfuYGeEbdCmEg4pvHrd34si3GDSohwqzI0lruzI_2iwCXYHFrYHYx"
        
        /// create URL
        let baseURL = "https://api.yelp.com/v3/businesses/search?latitude=\(latitude)&longitude=\(longitude)&limit=10"
        
        let url = URL(string: baseURL)
        
        /// Creating request
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        /// Initialize session and task
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(nil,error)
            }
            do {
                
                /// Read data as JSON
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                
                /// Main dictionary
                guard let resp = json as? NSDictionary else { return }

                /// Businesses
                guard let businesses = resp.value(forKey: "businesses") as? [NSDictionary] else { return }

                var venuesList: [VenueEntity] = []
                
                DatabaseManager.delete(entity_name: "VenueEntity")
                
                /// Accessing each business
                for business in businesses {
                    var venue = VenueEntity(context: DatabaseManager.context)
                    venue.name = business.value(forKey: "name") as? String
                    venue.id = business.value(forKey: "id") as? String
                    venue.rating = business.value(forKey: "rating") as! Double
                    venue.price = business.value(forKey: "price") as? String
                    venue.is_closed = business.value(forKey: "is_closed") as! Bool
                    venue.distance = business.value(forKey: "distance") as! Double
                    let address = business.value(forKeyPath: "location.display_address") as? [String]
                    venue.address = address?.joined(separator: "\n")
                    venue.review_count = business.value(forKey: "review_count") as! Int64
                    
                    
                    venuesList.append(venue)
                }
                
                completionHandler(venuesList, nil)
                
            } catch {
                print("Caught error")
                completionHandler(nil, error)
            }
            }.resume()
        
        
    }
    
    
}


    
