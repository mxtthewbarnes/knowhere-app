//
//  StreetViewPanorama.swift
//  knowhere
//
//  Created by Matthew Barnes on 6/25/25.
//

import SwiftUI
import GoogleMaps

struct StreetViewPanorama: UIViewRepresentable {
    let coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> GMSPanoramaView {
        let view = GMSPanoramaView(frame: .zero)
        view.moveNearCoordinate(coordinate)
        return view
    }

    func updateUIView(_ uiView: GMSPanoramaView, context: Context) {
        uiView.moveNearCoordinate(coordinate)
    }
}
