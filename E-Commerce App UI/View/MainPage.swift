//
//  MainPage.swift
//  E-Commerce App UI
//
//  Created by Adit on 25/06/23.
//

import SwiftUI

struct MainPage: View {
    // Current Tab...
    @State var currentTab: Tab = .Home
    
    // Hiding Tab Bar...
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        VStack(spacing: 0){
            
            // Tab View...
            TabView(selection: $currentTab) {
                
                Page()
                    .tag(Tab.Home)
                
                Train()
                    .tag(Tab.Form)
                
                Maps()
                    .tag(Tab.Maps)
                
                ProfilePage()
                    .tag(Tab.Profile)
                
                
            }
            
            // Custom Tab Bar...
            HStack(spacing: 0){
                ForEach(Tab.allCases,id: \.self){tab in
                    
                    Button {
                        // updating tab...
                        currentTab = tab
                    } label: {
                     
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            // Little shadow at bg...
                            .background(
                            
                                Color("Purple")
                                    .opacity(0.1)
                                    .cornerRadius(5)
                                // blurring...
                                    .blur(radius: 5)
                                    .padding(-7)
                                    .opacity(currentTab == tab ? 1 : 0)
                                
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color("Purple") : Color.black.opacity(0.3))
                    }
                }
            }
            .padding([.horizontal,.top])
            .padding(.bottom,10)
        }
        .background(Color("HomeBG").ignoresSafeArea())
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

// Tab Case
enum Tab: String,CaseIterable{
    
    // Image Name in asset..
    case Home = "Home"
    case Form = "Form"
    case Maps = "Maps"
    case Profile = "Profile"
}

