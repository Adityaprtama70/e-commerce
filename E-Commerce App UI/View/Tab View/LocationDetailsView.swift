import SwiftUI
import MapKit

struct LocationDetailsView: View {
  let place: Place
  
  var body: some View {
    VStack(spacing: 20) {
      Text(place.name)
        .font(.title)
      
      Text(place.coordinate.description)
        .font(.title2)
    }
    .navigationTitle(place.name)
  }
}

extension CLLocationCoordinate2D: CustomStringConvertible {
  public var description: String {
    "\(latitude);\(longitude)"
  }
}

struct LocationDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    LocationDetailsView(place: Place(name: "Gambir Station", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0)))
  }
}
