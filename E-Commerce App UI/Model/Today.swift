//
//  Today.swift
//  E-Commerce App UI
//
//  Created by Adit on 10/08/23.
//


import SwiftUI

// MARK: Data Model and Sample Data
struct Today: Identifiable{
    var id = UUID().uuidString
    var appName: String
    var appDescription: String
    var appLogo: String
    var bannerTitle: String
    var platformTitle: String
    var artwork: String
}

var todayItems: [Today] = [

    Today(appName: "Bandung", appDescription: "Bandung Station", appLogo: "KAI", bannerTitle: "Bandung Station", platformTitle: "Bandung", artwork: "station"),
    Today(appName: "Ranca Upas", appDescription: "Explore and Travel", appLogo: "1", bannerTitle: "Ranca Upas", platformTitle: "Ciwidey", artwork: "rancaupas"),
]

var dummyText = "Stasiun Bandung adalah stasiun kereta api besar tipe A yang berlokasi di Kota Bandung, Provinsi Jawa Barat. Stasiun yang dikenal pula sebagai Stasiun Hall ini berada dalam pengelolaan PT Kereta Api Indonesia (KAI) Daerah Operasi II Bandung. Stasiun tersebut merupakan stasiun kereta api terbesar di Bandung dan juga Provinsi Jawa Barat. Tidak heran bila stasiun tersebut menjadi titik penghubung Kota Bandung dengan berbagai kota besar lainnya di Pulau Jawa, seperti Jakarta, Surabaya, Malang, Semarang, dan lain-lain. Stasiun Bandung memiliki berbagai fasilitas penunjang demi kenyamanan para penumpangnya. Akses transportasi menuju Stasiun Bandung juga mudah karena terdapat sejumlah angkot yang melintasinya."
