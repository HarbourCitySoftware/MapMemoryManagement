//
//  MapViewController.swift
//  MapMemoryManagement
//
//  Created by Zachary Simone on 10/10/20.
//

import MapKit
import UIKit

final class MapViewController: UIViewController {

    private let mapView: MKMapView = {
        let map = MKMapView()
        let centreCoordinate = CLLocationCoordinate2D(latitude: -33.8688, longitude: 151.2093) // Centre of Sydney CBD
        let span = MKCoordinateSpan(latitudeDelta: 0.35, longitudeDelta: 0.35)
        let region = MKCoordinateRegion(center: centreCoordinate, span: span)
        map.setRegion(region, animated: true)
        return map
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
