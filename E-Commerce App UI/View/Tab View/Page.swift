//
//  Page.swift
//  E-Commerce App UI
//
//  Created by Adit on 09/08/23.
//

import SwiftUI

struct Page: View {
    
    @State private var searchText = ""
    @State private var searchResults: [String] = []
    
    let availableKeywords = ["Local", "MRT", "LRT", "KRL"]
    
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
                VStack (alignment: .leading) {
                    HStack {
                        Image(systemName: "line.horizontal.3.decrease")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Spacer()
                        Text("KAI Access")
                            .font(.system(.headline, design: .rounded))
                        Spacer()
                        Image("Profile_Image")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                    
                    // Title Name
                    
                    VStack (alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Hi")
                                .font(.largeTitle)
                            Text("Aditya")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                        }
                            Text("Let's Discover a New Traveler")
                                .font(.subheadline)
                                .fontWeight(.light)
                    }
                    .padding()
                    
                    // Search
                    
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(UIColor.systemIndigo))
                                .padding()
                            TextField("Search Train, Flight, etc..", text: $searchText)
                                .font(.footnote)
                                .padding()
                    
                            Spacer()
                            
                            Divider()
                                .frame(height: 24)
                            Image(systemName: "arrowtriangle.down.fill")
                                .resizable()
                                .frame(width: 8, height: 8)
                                .padding()
                            }
                        
                        .foregroundColor(Color.secondary.opacity(0.5))
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(80)
                        .shadow(radius: 1)
                        .padding()
                    }
                    
                    HStack {
                        VStack {
                            Button(action: {}) {
                                NavigationLink(destination: Train()) {
                                    Image(systemName: "tram.fill")
                                        .foregroundColor(Color.white)
                                        .padding(.all, 18)
                                        .background(Color.blue)
                                        .opacity(0.8)
                                        .cornerRadius(12)
                                        .shadow(radius: 12)
                                }
                            }
                            Text("Local")
                                .font(.footnote)
                                .bold()
                        }
                        
                        Spacer()
                        
                        VStack {
                            Button(action: {}) {
                                Image(systemName: "tram")
                                    .foregroundColor(Color.white)
                                    .padding(.all, 18)
                                    .background(Color.orange)
                                    .opacity(0.8)
                                    .cornerRadius(12)
                                    .shadow(radius: 12)
                            }
                            Text("MRT")
                                .font(.footnote)
                                .bold()
                        }
                        
                        Spacer()
                        
                        VStack {
                            Button(action: {}) {
                                Image(systemName: "cablecar")
                                    .foregroundColor(Color.white)
                                    .padding(.all, 18)
                                    .background(Color.red)
                                    .opacity(0.8)
                                    .cornerRadius(12)
                                    .shadow(radius: 12)
                            }
                            Text("KRL")
                                .font(.footnote)
                                .bold()
                        }
                        
                        Spacer()
                        
                        VStack {
                            Button(action: {}) {
                                Image(systemName: "rectangle.grid.2x2.fill")
                                    .foregroundColor(Color.white)
                                    .padding(.all, 18)
                                    .background(Color.purple)
                                    .opacity(0.8)
                                    .cornerRadius(12)
                                    .shadow(radius: 12)
                            }
                            Text("More")
                                .font(.footnote)
                                .bold()
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    HStack {
                        Text("Your")
                            .font(.largeTitle)
                        Text("Tips")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                    }
                    .padding(.vertical)
                    
                    HStack(spacing: 60) {
                        Text("Futured")
                            .bold()
                        Text("Past")
                            .foregroundColor(.secondary)
                        Text("All")
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack (spacing: 20) {
                            NavigationLink(destination: Home()) {
                                Image("bandung city")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 200, height: 270)
                                    .cornerRadius(12)
                            }
                            .buttonStyle(PlainButtonStyle())
                            Image("semarang city")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 270)
                                .cornerRadius(12)
                            
                            Image("jogja")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 270)
                                .cornerRadius(12)
                        }
                    }
                    .padding(.trailing, -20)
                }
                .padding()
                .foregroundColor(Color(UIColor.systemIndigo))
                .edgesIgnoringSafeArea(.bottom)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .accentColor(Color(UIColor.systemIndigo))
    }
    
    private func performSearch() {
            if searchText.isEmpty {
                searchResults = []
            } else {
                searchResults = availableKeywords.filter { keyword in
                    keyword.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    
    
}


struct Page_Previews: PreviewProvider {
    static var previews: some View {
        Page()
    }
}
