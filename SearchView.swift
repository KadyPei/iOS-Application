//
//  SearchView.swift
//  Eater
//
//  Created by Tiffany Hsu on 12/4/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import SwiftUI
import UIKit

struct SearchView: View {
    init(){
        UITableView.appearance().backgroundColor = .white
        UITableView.appearance().separatorColor = .clear
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    
    @State private var searchTerm: String = ""
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width:100,height:100)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(EdgeInsets(top: 0,leading: 20, bottom: 20, trailing: 20))
                
                Text("What do you want to eat today?")
                    .fontWeight(.semibold)
                    .padding(EdgeInsets(top:-20, leading: 20, bottom: 20, trailing: 20))
                
                NavigationLink(destination: RestaurantView()) {
                    HStack{
                        Image("tada").renderingMode(.original)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .shadow(color: Color.orange, radius: 10)
                        Text("Surprise Me!")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top:10, leading: 20, bottom: 10, trailing: 20))
                        .background(Color.init(red: 242/255, green: 163/255, blue:64/255))
                        .clipShape(RoundedRectangle(cornerRadius: 8))

                    }
                    
                }
                .padding(EdgeInsets(top: 0,leading: 20, bottom: 20, trailing: 20)).navigationBarTitle("Indecisive Eater", displayMode: .inline)
                
                Text("Search By Cuisine: ").fontWeight(.bold)
                CuisinesView()

                
//                NavigationLink(destination: SurpriseList()){
//                    Text("SEARCH")
//                }
                
//                NavigationLink(destination: MapView()){
//                                   Text("View Current Location")
//                }
                
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
