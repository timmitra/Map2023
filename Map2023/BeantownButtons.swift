//
//  BeantownButtons.swift
//  Map2023
//
//  Created by Tim Mitra on 2023-06-11.
//

import SwiftUI
import MapKit

struct BeantownButtons: View {
    
    @Binding var position: MapCameraPosition
    
    @Binding var searchResults: [MKMapItem]
    
    func search(for query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = MKCoordinateRegion(
            center: .parking,
            span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125))
        
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
        }
    }
    
    var body: some View {
        HStack {
            Button {
                search(for: "playground")
            } label: {
                Label("Playgrounds", systemImage: "figure.and.child.holdinghands")
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                search(for: "beach")
            } label: {
                Label("Playgrounds", systemImage: "beach.umbrella")
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                position = .region(.boston)
            } label: {
                Label("Boston", systemImage: "building.2")
            }
            .buttonStyle(.bordered)

            Button {
                position = .region(.northShore)
            } label: {
                Label("Playgrounds", systemImage: "water.waves")
            }
            .buttonStyle(.bordered)

        }
        .labelStyle(.iconOnly)
    }
}

//#Preview {
//    BeantownButtons(position: <#Binding<MapCameraPosition>#>, searchResults: Binding<[MKMapItem]>)
//}
