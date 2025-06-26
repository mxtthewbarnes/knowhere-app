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

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 0, longitude: 0, zoom: 2)
        let mapView = GMSMapView(frame: .zero, camera: camera)
        mapView.delegate = context.coordinator
        return mapView
    }

    
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        mapView.clear()
        
        
        //guess marker
        if let coordinate = selectedCoordinate {
            let guessMark = GMSMarker(position: coordinate)
            guessMark.icon = GMSMarker.markerImage(with: .red)
            guessMark.map = mapView
            
            //actual marker
            if let actual = actualCoordinate{
                let actualMark = GMSMarker(position: actual)
                actualMark.icon = GMSMarker.markerImage(with: .orange)
                actualMark.map = mapView
                
                
                //distance between guess and actual
                let path = GMSMutablePath()
                path.add(actual)
                path.add(coordinate)
                let line = GMSPolyline(path: path)
                line.strokeColor = .orange
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
