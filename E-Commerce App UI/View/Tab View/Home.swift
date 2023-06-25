//
//  Home.swift
//  E-Commerce App UI
//
//  Created by Adit on 25/06/23.
//

import SwiftUI

struct Home: View {
    @Namespace var animation
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15){
                
                // Search Bar...
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    // Search bar....
                    TextField("Search", text: .constant(""))
                        .disabled(true)
                }
                .padding(.vertical,12)
                .padding(.horizontal)
                .background(
                
                    Capsule()
                        .strokeBorder(Color.gray,lineWidth: 0.8)
                )
                .frame(width: getRect().width / 1.6)
                .padding(.horizontal,25)
                
                Text("Order online\ncollect in store")
                    .font(.custom(customFont, size: 28).bold())
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal,25)
                
                // Products Tab....
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 18){
                        
                        ForEach(ProductType.allCases,id: \.self){type in
                            
                            // Product Type View...
                            ProductTypeView(type: type)
                        }
                    }
                    .padding(.horizontal,25)
                }
                .padding(.top,28)
                
                // Products Page...
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 25){
                        
                        ForEach(homeData.filteredProducts){product in
                            
                            // Product Card View...
                            ProductCardView(product: product)
                        }
                    }
                    .padding(.horizontal,25)
                    .padding(.bottom)
                    .padding(.top,80)
                }
                .padding(.top,30)
                
                Button {
                    homeData.showMoreProductsOnType.toggle()
                } label: {
                    
                    // Image ar right...
                    Label {
                        Image(systemName: "arrow.right")
                    } icon: {
                        Text("see more")
                    }
                    .font(.custom(customFont, size: 15).bold())
                    .foregroundColor(Color("Purple"))
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding(.trailing)
                .padding(.top,10)

            }
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("HomeBG"))
        .onChange(of: homeData.productType) { newValue in
            homeData.filterProductByType()
        }
        .sheet(isPresented: $homeData.showMoreProductsOnType) {
        } content: {
        }

    }
    
    @ViewBuilder
    func ProductCardView(product: Product)->some View{
        
        VStack(spacing: 10){
            
            Image(product.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getRect().width / 2.5, height: getRect().width / 2.5)
                .offset(y: -80)
                .padding(.bottom,-80)
            
            Text(product.title)
                .font(.custom(customFont, size: 18))
                .fontWeight(.semibold)
                .padding(.top)
            
            Text(product.subtitle)
                .font(.custom(customFont, size: 14))
                .foregroundColor(.gray)
            
            Text(product.price)
                .font(.custom(customFont, size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color("Purple"))
                .padding(.top,5)
        }
        .padding(.horizontal,20)
        .padding(.bottom,22)
        .background(
        
            Color.white
                .cornerRadius(25)
        )
    }
    
    @ViewBuilder
    func ProductTypeView(type: ProductType)->some View{
        
        Button {
            // Updating Current Type...
            withAnimation{
                homeData.productType = type
            }
        } label: {
            
            Text(type.rawValue)
                .font(.custom(customFont, size: 15))
                .fontWeight(.semibold)
                .foregroundColor(homeData.productType == type ? Color("Purple") : Color.gray)
                .padding(.bottom,10)
                .overlay(
                
                    // Geometry Effect...
                    ZStack{
                        if homeData.productType == type{
                            Capsule()
                                .fill(Color("Purple"))
                                .matchedGeometryEffect(id: "PRODUCTTAB", in: animation)
                                .frame(height: 2)
                        }
                        else{
                            
                            Capsule()
                                .fill(Color.clear)
                                .frame(height: 2)
                        }
                    }
                    .padding(.horizontal,-5)
                    
                    ,alignment: .bottom
                )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Extention

extension View {
    func getRect()->CGRect {
        return UIScreen.main.bounds
    }
}
