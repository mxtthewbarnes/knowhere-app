//
//  GuessMapView.swift
//  knowhere
//
//  Created by Matthew Barnes on 6/25/25.
//

import SwiftUI
import GoogleMaps

struct GuessMapView: UIViewRepresentable {
    @Binding var selectedCoordinate: CLLocationCoordinate2D?
    var actualCoordinate: CLLocationCoordinate2D?
    var mode: GameMode

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> GMSMapView {
            var centerLat: Double = 0
            var centerLong: Double = 0
            var zoom: Float = 2

            // Adjust per mode
            switch mode {
            case .usa:
                centerLat = 39.8283
                centerLong = -98.5795
                zoom = 3
            case .europe:
                centerLat = 54.5260
                centerLong = 15.2551
                zoom = 4
            case .college:
                centerLat = 39.8283
                centerLong = -98.5795
                zoom = 4
            case .world:
                centerLat = 0
                centerLong = 0
                zoom = 2
            }

            let camera = GMSCameraPosition.camera(
                withLatitude: centerLat,
                longitude: centerLong,
                zoom: zoom
            )

            let mapView = GMSMapView(frame: .zero, camera: camera)
            mapView.delegate = context.coordinator
            return mapView
        }
    
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        mapView.clear()
        
        let hotOrange = UIColor(red: 1.0, green: 0.4, blue: 0.0, alpha: 1.0)

        
        //guess marker
        if let coordinate = selectedCoordinate {
            let guessMark = GMSMarker(position: coordinate)
            guessMark.icon = GMSMarker.markerImage(with: .darkgreyslate)
            guessMark.map = mapView
            
            //actual marker
            if let actual = actualCoordinate{
                let actualMark = GMSMarker(position: actual)
                actualMark.icon = GMSMarker.markerImage(with: .red)
                actualMark.map = mapView
                
                
                //distance between guess and actual
                let path = GMSMutablePath()
                path.add(actual)
                path.add(coordinate)
                let line = GMSPolyline(path: path)
                line.strokeColor = hotOrange
                line.strokeWidth = 2.0
                line.map = mapView
        }
        }
        
    }

    class Coordinator: NSObject, GMSMapViewDelegate {
        var parent: GuessMapView

        init(_ parent: GuessMapView) {
            self.parent = parent
        }

        func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
            parent.selectedCoordinate = coordinate
        }
    }
}
