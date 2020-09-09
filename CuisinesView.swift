//
//  CuisinesView.swift
//  Eater
//
//  Created by Tiffany Hsu on 12/3/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import SwiftUI

struct Cuisine {
    var id: Int
    let title, imageUrl, placesUrl: String
}

struct CuisinesView: View {
    
    let cuisines:[Cuisine] = [Cuisine(id: 0, title: "American", imageUrl: "0", placesUrl:"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.7297,-73.9972&radius=500&opennow=true&keyword=american&key=AIzaSyAxqYeZ0jnlipcj6IsTumuIcUDOoBvXAwk"),
                              Cuisine(id: 1, title: "Italian", imageUrl: "1", placesUrl:"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.7297,-73.9972&radius=500&opennow=true&keyword=italian&key=AIzaSyAxqYeZ0jnlipcj6IsTumuIcUDOoBvXAwk"),
                              Cuisine(id: 2, title: "French", imageUrl: "2", placesUrl:"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.7297,-73.9972&radius=500&opennow=true&keyword=french&key=AIzaSyAxqYeZ0jnlipcj6IsTumuIcUDOoBvXAwk"),
                              Cuisine(id: 3, title: "Chinese", imageUrl: "3", placesUrl:"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.7297,-73.9972&radius=500&opennow=true&keyword=chinese&key=AIzaSyAxqYeZ0jnlipcj6IsTumuIcUDOoBvXAwk"),
                              Cuisine(id: 4, title: "Japanese", imageUrl: "4", placesUrl:"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.7297,-73.9972&radius=500&opennow=true&keyword=japanese&key=AIzaSyAxqYeZ0jnlipcj6IsTumuIcUDOoBvXAwk")]
    
    var body: some View {
        ScrollView(.horizontal) {
                HStack {
                    ForEach(cuisines, id:\.id) { cuisine in
                        CV(cuisine:  cuisine)
                    }
                }
//            }.buttonStyle(PlainButtonStyle())
        }.padding(20)
    }
}

struct CV: View {
    var cuisine: Cuisine
    var body: some View {
        VStack {
            NavigationLink(destination: RestaurantView()) {
                Image("\(cuisine.imageUrl)")
                    .resizable()
                    .cornerRadius(12)
                    .frame(width: 80, height:80)
                Text(cuisine.title)
                    .font(.subheadline)
                    .fontWeight(.bold)
            }.buttonStyle(PlainButtonStyle())
        }
    }
}

struct CuisinesView_Previews: PreviewProvider {
    static var previews: some View {
        CuisinesView()
    }
}

/*
 struct ListDetailView: View {
 
 var item: ListElement
 
 var body: some View {
     VStack{
         MapView()
             .edgesIgnoringSafeArea(.top)
             .frame(height:310)
             .padding(.top,-50)
         VStack {
             Image(item.image).resizable().cornerRadius(30)
                 .overlay(Rectangle().stroke(Color.white, lineWidth:4))
                 .shadow(radius:10)
                 .frame(width:250,height:200)
                 .offset(y: -100)
                 .padding(.bottom, -100)
             Text(item.title)
                 .font(.largeTitle)
                 .fontWeight(.bold)
                 .padding(.top, 10)
         }
     }
 }
 */
