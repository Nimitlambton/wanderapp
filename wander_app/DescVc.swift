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
    var p = [Mapdesc]()
    var locationToEdit: Mapdesc?
    var indexEdit :Int?
    var desc = ""
    var save = true
    var maplist = [Mapdesc]()
    
  //  var z = [Mapdesc?]()
    
    @IBOutlet weak var longi: UITextField!
    @IBOutlet weak var lat: UITextField!
    @IBOutlet weak var locationTitle: UITextField!
    
    @IBOutlet weak var locationSubtitle: UITextField!
 
    var coordinate = CLLocationCoordinate2D(latitude: 0,longitude: 0)
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        longi.text = String(coordinate.longitude)
        lat.text = String(coordinate.latitude)
        p = fetchRecords()
      //  print(indexEdit)
       
        if indexEdit != nil {
            
            print(p[indexEdit!])
        
            mapdesc1 = p[indexEdit!]
            
            longi.text = String( p[indexEdit!].long)
            lat.text = String( p[indexEdit!].lat)
            locationTitle.text = String(p[indexEdit!].locationtitle!)
            locationSubtitle.text = String(p[indexEdit!].locationsubtitile!)
            
            
            
        
        }
      
        
        
    }
    
    
    func fetchRecords() -> [Mapdesc]{
       //
        let fetchRequest = NSFetchRequest<Mapdesc>(entityName: "Mapdesc")
        
        do{
            maplist = try ViewController.managedContext.fetch(fetchRequest)
        }catch{
            print(error)
        }
        return maplist
    }
    
    
    
    
    
    
    @IBAction func save(_ sender: Any) {

        let cpp = Mapdesc(context: ViewController.managedContext)
              let titlee = locationTitle.text ?? ""
              let subtitle = locationSubtitle.text ?? ""
              let finalongitutde = Double(longi.text!)
              let finallatitutde = Double(lat.text!)
        
        
        if save {
      
    
        cpp.locationsubtitile = subtitle
        cpp.locationtitle = titlee
        cpp.lat = finallatitutde!
        cpp.long = finalongitutde!
        
       try! ViewController.managedContext.save()
        
        print("saved")
    
        }
        
        else {
            
          
            if let mapde = mapdesc1{
                
                
                mapde.lat = finallatitutde!
                mapde.long = finalongitutde!
                mapde.locationsubtitile = subtitle
                mapde.locationtitle = titlee
                
                locationToEdit = mapde
                
            }
            else {
                
                print("void")
                
            }
                
                
            }
            
           
            

            }
            
            
            
            
        }
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


