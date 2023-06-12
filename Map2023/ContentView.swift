//
//  ContentView.swift
//  Map2023
//
//  Created by Tim Mitra on 2023-06-11.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let parking = CLLocationCoordinate2D(latitude: 42.354528, longitude: -71.068369)
}

struct ContentView: View {
    var body: some View {
        Map {
            Marker("Parking", coordinate: .parking)
        }
    }
}

#Preview {
    ContentView()
}
