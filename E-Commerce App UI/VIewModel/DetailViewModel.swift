//
//  DetailViewModel.swift
//  E-Commerce App UI
//
//  Created by Adit on 10/08/23.
//

import SwiftUI

class DetailViewModel: ObservableObject {

    @Published var selectedItem = TodayItem(title: "", category: "", overlay: "", contentImage: "", logo: "")
    
    @Published var show = false
}
