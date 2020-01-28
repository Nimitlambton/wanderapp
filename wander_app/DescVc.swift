//
//  DescVc.swift
//  wander_app
//
//  Created by MacStudent on 2020-01-27.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import MapKit
import CoreData
class DescVc: UIViewController {

    
    
    var managedObjectContext: NSManagedObjectContext!
 
    var mapdesc1 :Mapdesc?
    var locationToEdit: Mapdesc?
  
    var desc = ""
    
    
    @IBOutlet weak var longi: UITextField!
    @IBOutlet weak var lat: UITextField!
    @IBOutlet weak var locationTitle: UITextField!
    
    @IBOutlet weak var locationSubtitle: UITextField!
 
    var coordinate = CLLocationCoordinate2D(latitude: 0,longitude: 0)
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        longi.text = String(coordinate.longitude)
        lat.text = String(coordinate.latitude)
    
        if let location = locationToEdit {
          title = "Edit Location"
        }
        
    }
    

    
    
    @IBAction func save(_ sender: Any) {

        let cpp = Mapdesc(context: ViewController.managedContext)
        
        let title = locationTitle.text ?? ""
        let subtitle = locationSubtitle.text ?? ""
        let finalongitutde = Double(longi.text!)
        let finallatitutde = Double(lat.text!)
    
        cpp.locationsubtitile = subtitle
        cpp.locationtitle = title
        cpp.lat = finallatitutde!
        cpp.long = finalongitutde!
        
       try! ViewController.managedContext.save()
        
     print("saved")
    
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
