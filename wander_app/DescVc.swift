//
//  DescVc.swift
//  wander_app
//
//  Created by MacStudent on 2020-01-27.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import MapKit
class DescVc: UIViewController {

    
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
