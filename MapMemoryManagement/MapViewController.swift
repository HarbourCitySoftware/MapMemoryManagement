//
//  MapViewController.swift
//  MapMemoryManagement
//
//  Created by Zachary Simone on 10/10/20.
//

import Combine
import MapKit
import UIKit

final class MapViewController: UIViewController {
    private var cancellable: Set<AnyCancellable> = .init()

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
        addMap()

        NotificationCenter.default
            .publisher(for: UIApplication.didEnterBackgroundNotification)
            .sink { [weak self] _ in self?.removeMap() }
            .store(in: &cancellable)

        NotificationCenter.default
            .publisher(for: UIApplication.didBecomeActiveNotification)
            .sink { [weak self] _ in self?.addMap() }
            .store(in: &cancellable)

    }

    private func addMap() {
        removeMap() // Ensure map isn't already in view hierarchy before trying to add
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func removeMap() {
        mapView.removeFromSuperview()
    }
}
