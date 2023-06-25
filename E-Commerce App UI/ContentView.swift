//
//  ContentView.swift
//  E-Commerce App UI
//
//  Created by Adit on 25/06/23.
//

import SwiftUI

struct ContentView: View {
    // Log Status..
    @AppStorage("log_Status") var log_Status: Bool = false
    var body: some View {
        Group{
            if log_Status{
                MainPage()
            }
            else{
                OnBoardingPage()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
