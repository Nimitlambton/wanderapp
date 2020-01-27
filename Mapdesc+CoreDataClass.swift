//
//  Mapdesc+CoreDataClass.swift
//  wander_app
//
//  Created by MacStudent on 2020-01-27.
//  Copyright © 2020 MacStudent. All rights reserved.
//
//

import Foundation
import CoreData
import MapKit
@objc(Mapdesc)
public class Mapdesc: NSManagedObject,MKAnnotation{
   
    public var coordinate: CLLocationCoordinate2D{
        
            return CLLocationCoordinate2DMake(lat, long)
        

    }
    
    public var title: String? {
        if locationsubtitile!.isEmpty {
        return "(No subtitile)"
      } else {
        return locationsubtitile
      }
    }
    
    public var subtitle: String? {
      return locationsubtitile
    }
    
  
  
    

  
}


