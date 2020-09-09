//
//  ListDetail.swift
//  Eater
//
//  Created by Kady Pei on 12/12/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

//import Foundation
import SwiftUI

struct ListDetail: View {
    var item: Restaurant
   // var array: [Restaurant]
    var body: some View {
        VStack{
            MapView(lat: item.lat, long: item.long)
                .edgesIgnoringSafeArea(.top)
                .frame(height:310)
                .padding(.top,-50)
            VStack {
                Image(item.logo).resizable().cornerRadius(30)
                    .overlay(Rectangle().stroke(Color.white, lineWidth:4))
                    .shadow(radius:10)
                    .frame(width:250,height:200)
                    .offset(y: -100)
                    .padding(.bottom, -100)
                
                Text(item.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 10)
               // Button
                Button(action: {
                    //self.item.append(Restaurant(value:""))
                    //array.append(item)
                    SavedFavorite.instance.arraylist.append(self.item)

                }, label: {
                    Text("Add List")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.all, 16)
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 8))

                })
            }
        }

        //Hstack{}
    }
}
//struct addtolist:
