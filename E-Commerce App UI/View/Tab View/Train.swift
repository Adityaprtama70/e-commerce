//
//  Train.swift
//  E-Commerce App UI
//
//  Created by Adit on 10/08/23.
//

import SwiftUI

struct TrainStation: Identifiable {
    let id = UUID()
    let name: String
}

struct TrainStationView: View {
    @State private var originIndex = 0
    @State private var destinationIndex = 0
    @State private var departureDate = Date()
    @State private var passengerCount = 1
    
    let trainStations: [TrainStation] = [
        TrainStation(name: "Jakarta"),
        TrainStation(name: "Bandung"),
        TrainStation(name: "Surabaya"),
        TrainStation(name: "Yogyakarta"),
        // Add more train stations here
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Origin")) {
                    Picker(selection: $originIndex, label: Text("Select Origin")) {
                        ForEach(0..<trainStations.count) { index in
                            Text(trainStations[index].name).tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Destination")) {
                    Picker(selection: $destinationIndex, label: Text("Select Destination")) {
                        ForEach(0..<trainStations.count) { index in
                            Text(trainStations[index].name).tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Departure Date")) {
                    DatePicker("Select Date", selection: $departureDate, displayedComponents: .date)
                }
                
                Section(header: Text("Passenger")) {
                    Stepper("Passenger Count: \(passengerCount)", value: $passengerCount, in: 1...10)
                }
                
                Section {
                    Button(action: {
                        // Perform booking logic here
                        // You can use the selected values: trainStations[originIndex], trainStations[destinationIndex], departureDate, passengerCount
                    }) {
                        Text("Booking")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .navigationTitle("Train Booking")
        }
    }
}

@main
struct TrainBookingApp: App {
    var body: some Scene {
        WindowGroup {
            TrainBookingApp()
        }
    }
}

