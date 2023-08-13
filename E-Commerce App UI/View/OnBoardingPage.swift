//
//  OnBoardingPage.swift
//  E-Commerce App UI
//
//  Created by Adit on 25/06/23.
//

import SwiftUI

// To Use the custom font on all pages..
let customFont = "Raleway-Regular"

struct OnBoardingPage: View {
    // Showing Login Page...
    @State var showLoginPage: Bool = false
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("Find your\n Ticket")
                .font(.custom(customFont, size: 55))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(30)
            
            Image("10966")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button {
                withAnimation{
                    showLoginPage = true
                }
            } label: {
             
                Text("Get started")
                    .font(.custom(customFont, size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical,18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color("Purple"))
            }
            .padding(.horizontal,30)
            // Adding Some Adjustments only for larger displays...
         //   .offset(y: getRect().height < 750 ? 20 : 40)
            
            Spacer()
        }
        .padding(.vertical, 80)
   //     .padding(.top,getRect().height < 750 ? 0 : 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
        
            Color("Purple")
        )
        .overlay(
        
            Group{
                if showLoginPage{
                    LoginPage()
                        .transition(.move(edge: .bottom))
                }
            }
        )
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
    }
}


