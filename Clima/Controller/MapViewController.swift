//
//  MapViewController.swift
//  Clima
//
//  Created by Nguyen Tran on 8/9/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = UITapGestureRecognizer(
                                      target: self, action:#selector(handleTap))
            gestureRecognizer.delegate = self
            mapView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func handleTap(gestureRecognizer: UITapGestureRecognizer) {
        
        let location = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        
        // Add annotation:
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        
        // confirm location alert
        let alert = UIAlertController(title: "Confirmation", message: "Are you sure you want to choose this location", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Hell Yeah", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) in
            print("ok")
            
        }))

        alert.addAction(UIAlertAction(title: "Heck No", style: UIAlertAction.Style.destructive, handler: { (action: UIAlertAction!) in
            print("NO")
            self.mapView.removeAnnotation(annotation)
        }))

        self.present(alert, animated: true, completion: nil)
        
    }
    
}
