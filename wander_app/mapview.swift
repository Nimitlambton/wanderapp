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
    var buttontosend :Int?
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
          
        mapView.addAnnotations(locations)
   
    }

    
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

    @IBAction func show(_ sender: Any) {
   let theRegion = region(for: locations)
  mapView.setRegion(theRegion, animated: true)
    
    }
    
    
    @objc func showLocationDetails(_ sender: UIButton) {
        
          let button = sender as UIButton
           buttontosend = button.tag
          performSegue(withIdentifier: "EditLocation", sender: sender)

      
      }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditLocation"{
            
            let controller = segue.destination as! DescVc
            controller.indexEdit = buttontosend
            
        }
    }
    
    
    
    
    
    
    
    func region(for annotations: [MKAnnotation]) -> MKCoordinateRegion {
         let region: MKCoordinateRegion
         
         switch annotations.count {
         case 0:
            region = MKCoordinateRegion(
                center: mapView.userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
           
         case 1:
           let annotation = annotations[annotations.count - 1]
           region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
           
         default:
           var topLeft = CLLocationCoordinate2D(latitude: -90, longitude: 180)
           var bottomRight = CLLocationCoordinate2D(latitude: 90, longitude: -180)
           
           for annotation in annotations {
             topLeft.latitude = max(topLeft.latitude, annotation.coordinate.latitude)
             topLeft.longitude = min(topLeft.longitude, annotation.coordinate.longitude)
             bottomRight.latitude = min(bottomRight.latitude, annotation.coordinate.latitude)
             bottomRight.longitude = max(bottomRight.longitude, annotation.coordinate.longitude)
           }
           
           let center = CLLocationCoordinate2D(latitude: topLeft.latitude - (topLeft.latitude - bottomRight.latitude) / 2, longitude: topLeft.longitude - (topLeft.longitude - bottomRight.longitude) / 2)
           
           let extraSpace = 1.1
           let span = MKCoordinateSpan(latitudeDelta: abs(topLeft.latitude - bottomRight.latitude) * extraSpace, longitudeDelta: abs(topLeft.longitude - bottomRight.longitude) * extraSpace)
           
           region = MKCoordinateRegion(center: center, span: span)
         }
         
         return mapView.regionThatFits(region)
     }
    
    
  
    
    
    
    
  
    
}














extension mapview:MKMapViewDelegate{
    
    

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       //1 to ignore other obj present
        guard annotation is Mapdesc else {
           print("hey this is not pin")
            return nil
        }
        //2
        
        
        let identifier = "Location"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
         if annotationView == nil {
          let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
         
            //3
          pinView.isEnabled = true
          pinView.canShowCallout = true
          pinView.animatesDrop = true
          pinView.pinTintColor = UIColor(red:0.44, green:0.10, blue:0.71, alpha:1.0)
        
            //4 button type detailDisclorse
            let rightButton = UIButton(type: .contactAdd)
          
            //This method takes one parameter, sender, that refers to the control that sent the action message. In this case, the sender will be the i button. That’s why the type of the sender parameter is UIButton.
          
            
            rightButton.addTarget(self, action: #selector(showLocationDetails), for: .touchUpInside)
        
            pinView.leftCalloutAccessoryView = rightButton
            annotationView = pinView
        }
        
        if let annotationView = annotationView {
          annotationView.annotation = annotation
        
            //5
            let button = annotationView.leftCalloutAccessoryView as! UIButton
            if let index = locations.firstIndex(of: annotation as! Mapdesc) {
            button.tag = index
          }
        }
        return annotationView
    }
    
}
