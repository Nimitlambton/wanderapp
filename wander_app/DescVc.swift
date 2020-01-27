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
    
    @IBOutlet weak var long: UILabel!

    @IBOutlet weak var lati: UILabel!

    @IBOutlet weak var locationTitle: UITextField!
    
    @IBOutlet weak var locationSubtitle: UITextField!
 
    var coordinate = CLLocationCoordinate2D(latitude: 0,longitude: 0)
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        long.text = String(coordinate.longitude)
        lati.text = String(coordinate.latitude)
    
    }
    

    
    
    @IBAction func save(_ sender: Any) {
    
    
        let title = locationTitle.text ?? ""
        let subtitle = locationSubtitle.text ?? ""
    
        mapdesc1?.locationsubtitile = subtitle
        mapdesc1?.locationtitle = title
        mapdesc1?.lat = (43.7372371)
        mapdesc1?.long = (-79.345544)
        
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
