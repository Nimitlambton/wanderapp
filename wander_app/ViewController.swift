//
//  ViewController.swift
//  wander_app
//
//  Created by MacStudent on 2020-01-27.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class ViewController: UIViewController , CLLocationManagerDelegate  {

    static var managedContext: NSManagedObjectContext!
    
    lazy var persistentContainer: NSPersistentContainer = { let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: {
        storeDescription, error in
        if let error = error {
          fatalError("Could load data store: \(error)")
        }
    })
      return container
    }()
    
    
    
    let mylocation = CLLocationManager()
    
    var location : CLLocation?
    
    var firstCordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    @IBOutlet weak var long: UILabel!
    @IBOutlet weak var lat: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

       let authStatus = CLLocationManager.authorizationStatus()
    
       
      

    
    
    @IBAction func getloc(_ sender: UIButton) {

        if authStatus == .notDetermined { mylocation.requestWhenInUseAuthorization()
                    
                         return
                    
                     }
        
        mylocation.delegate = self
        mylocation.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        mylocation.startUpdatingLocation()
    
        updatelabels()

        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let currentlocation = locations.last
        location = currentlocation
       // print(currentlocation)
        
    }
    
    func updatelabels(){
        
    
        if let location = location{
            
            
            lat.text = String(location.coordinate.latitude)
            long.text = String(location.coordinate.longitude)
      
            firstCordinate.latitude = Double(location.coordinate.latitude)
            firstCordinate.longitude = Double(location.coordinate.longitude)
        
        }
    
        
    }
    
    
    
    
    
    @IBAction func sendLocation(_ sender: Any) {
        
        
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "lnlpass"
        {
            
            let controller = segue.destination as! DescVc
            
            controller.coordinate.latitude = firstCordinate.latitude
            controller.coordinate.longitude = firstCordinate.longitude
            
            
        }
    }
    
}

