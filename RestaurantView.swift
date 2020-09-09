//
//  RestaurantView.swift
//  Eater
//
//  Created by Charmaine Chan on 8/12/2019.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import SwiftUI
import CoreLocation

struct RestaurantView: View {
    var cuisine: Cuisine
    @ObservedObject var fetcher = RestaurantFetcher()
  //  var restaurants: Restaurant
    var body: some View {
        NavigationView() {
            List(fetcher.restaurants) { restaurant in
                NavigationLink(destination: ListDetail(item: restaurant)) {
                    HStack {
                        Image(restaurant.logo).resizable().renderingMode(.original).aspectRatio(contentMode: .fit).frame(width: 80,height: 80)
                       VStack(alignment: .leading) {
                           Text(restaurant.name).font(.headline).fontWeight(.bold)
                           Text("Rating: \(restaurant.rating!.description)").font(.subheadline).foregroundColor(Color.gray)
                       }
                    }
                }
            }.navigationBarTitle(Text("Restaurants Near YOU!"), displayMode: .inline)
        }
    }
}

struct Restaurant_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView(cuisine: Cuisine(id: 0, title: "American", imageUrl: "0", placesUrl:"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.7297,-73.9972&radius=500&opennow=true&keyword=american&key=AIzaSyAxqYeZ0jnlipcj6IsTumuIcUDOoBvXAwk"))
    }
}

