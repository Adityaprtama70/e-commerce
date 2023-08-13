//
//  TrainStation.swift
//  E-Commerce App UI
//
//  Created by Adit on 10/08/23.
//

import SwiftUI

struct TrainStation: Identifiable {
    let id = UUID()
    let name: String
}

struct Train: View {
    @State private var selectedOrigin: TrainStation?
    @State private var selectedDestination: TrainStation?
    @State private var isReturnTrip = false
    @State private var departureDate = Date()
    @State private var returnDate = Date()
    @State private var passengerCount = 1
    
    let trainStations: [TrainStation] = [
        TrainStation(name: "Jakarta"),
        TrainStation(name: "Bandung"),
        TrainStation(name: "Surabaya"),
        TrainStation(name: "Yogyakarta"),
        // Tambahkan stasiun-stasiun lainnya di sini
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Origin")) {
                    Menu {
                        ForEach(trainStations) { station in
                            Button(action: {
                                selectedOrigin = station
                            }) {
                                Text(station.name)
                            }
                        }
                    } label: {
                        Text(selectedOrigin?.name ?? "Select Origin")
                    }
                }
                
                Section(header: Text("Destination")) {
                    Menu {
                        ForEach(trainStations) { station in
                            Button(action: {
                                selectedDestination = station
                            }) {
                                Text(station.name)
                            }
                        }
                    } label: {
                        Text(selectedDestination?.name ?? "Select Destination")
                    }
                }
                
                Section(header: Text("Trip Type")) {
                    Toggle(isOn: $isReturnTrip) {
                        Text("Return Trip")
                    }
                    if isReturnTrip {
                        DatePicker("Return Date", selection: $returnDate, displayedComponents: .date)
                    }
                }
                
                Section(header: Text("Departure Date")) {
                    DatePicker("Select Date", selection: $departureDate, displayedComponents: .date)
                }
                
                Section(header: Text("Passenger")) {
                    Stepper("Passenger Count: \(passengerCount)", value: $passengerCount, in: 1...10)
                }
                
                Section {
                    Button(action: {
                        // Lakukan logika booking di sini
                        // Anda bisa menggunakan nilai yang terpilih: selectedOrigin, selectedDestination, isReturnTrip, departureDate, returnDate, passengerCount
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


