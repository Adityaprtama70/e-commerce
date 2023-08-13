//
//  TodayItem.swift
//  E-Commerce App UI
//
//  Created by Adit on 10/08/23.
//

import SwiftUI

// Model And Model Data...

struct TodayItem: Identifiable {
    
    var id = UUID().uuidString
    var title: String
    var category: String
    var overlay: String
    var contentImage: String
    var logo: String
}

var items = [

    TodayItem(title: "Forza Street", category: "Ultimate Street Racing Game", overlay: "GAME OF THE DAY", contentImage: "b1", logo: "l1"),
    
    TodayItem(title: "Roblox", category: "Adventure", overlay: "Li Nas X Performs In Roblox", contentImage: "b2", logo: "l2")
]
