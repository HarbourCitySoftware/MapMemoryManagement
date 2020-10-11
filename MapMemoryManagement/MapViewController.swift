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

    private var mapView: MKMapView?

    /// Position of the map to restore once adding map view back to heirarchy
    private var mapCamera: MKMapCamera?

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
        mapView = generateMapView()
        guard let map = mapView else { return }
        view.addSubview(map)
        map.translatesAutoresizingMaskIntoConstraints = false
        map.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        map.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        map.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.mapView = map

        if let mapCamera = self.mapCamera {
            self.mapView?.setCamera(mapCamera, animated: false)
            self.mapCamera = nil
        }
    }

    private func removeMap() {
        if let map = mapView,
           map.camera.centerCoordinate.latitude != 0 && map.camera.centerCoordinate.longitude != 0 {
            mapCamera = mapView?.camera
        }
        mapView?.removeFromSuperview()
        mapView = nil
    }

    private func generateMapView() -> MKMapView {
        let map = MKMapView()
        let centreCoordinate = CLLocationCoordinate2D(latitude: -33.8688, longitude: 151.2093) // Centre of Sydney CBD
        let span = MKCoordinateSpan(latitudeDelta: 0.35, longitudeDelta: 0.35)
        let region = MKCoordinateRegion(center: centreCoordinate, span: span)
        map.setRegion(region, animated: true)
        return map
    }
}
