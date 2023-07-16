//
//  Maps.swift
//  E-Commerce App UI
//
//  Created by Adit on 13/07/23.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
  let id = UUID()
  var name: String
  var coordinate: CLLocationCoordinate2D
}

struct Maps: View {
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -6.1970, longitude: 106.8226), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
  
  var empireStateBuilding =
  Place(name: "Menara BCA", coordinate: CLLocationCoordinate2D(latitude: -6.1970, longitude: 106.8226))
  
  var body: some View {
    NavigationView {
      Map(coordinateRegion: $region, annotationItems: [empireStateBuilding]) { place in
        MapAnnotation(coordinate: place.coordinate) {
          NavigationLink {
            LocationDetailsView(place: place)
          } label: {
            PlaceAnnotationView(title: place.name)
          }
        }
      }
      .ignoresSafeArea(edges: .bottom)
      .navigationTitle("Location Aditya")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}
