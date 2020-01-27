//
//  mapview.swift
//  wander_app
//
//  Created by MacStudent on 2020-01-27.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import MapKit
import CoreData
class mapview: UIViewController {

  
    
    @IBOutlet weak var mapView: MKMapView!
    
  var locations = [Mapdesc]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       updateLocations()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        updateLocations()
    }
    
    func updateLocations() {

        mapView.removeAnnotations(locations)
        
        let entity = Mapdesc.entity()
      
         let fetchreq = NSFetchRequest<Mapdesc>()
        
         fetchreq.entity = entity
        
        locations = try! ViewController.managedContext.fetch(fetchreq)
       print("heloo:")
          print(locations)
        mapView.addAnnotations(locations)
   
    }

    
    
    
//          func fetchRecords() -> [Person]{
//                //
//                 let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
//
//                 do{
//                     personlist = try ViewController.managedContext.fetch(fetchRequest)
//                 }catch{
//                     print(error)
//                 }
//                 return personlist
//             }
    
    
    
    
    
    @IBAction func zoominto(_ sender: Any) {
   
        
        let region = MKCoordinateRegion(
            center: mapView.userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
    
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
