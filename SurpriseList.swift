//
//  RestaurantList.swift
//  Eater
//
//  Created by Tiffany Hsu on 12/4/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//
import SwiftUI
import Foundation

struct ListElement: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var icon: String
    var image: String
    var text: String
}


struct SurpriseList: View {

    @State var modelData: [ListElement] = [ListElement(title: "Saigon Shack", icon: "saigonlogo", image: "saigon", text: "Vietnamese eats provider where pho & banh mi are popular, as are sweet potato fries & Thai coffee.")
        , ListElement(title: "Bareburger", icon: "barelogo", image: "bareburger", text: "Casual, eco-minded regional chain for organic burgers (from beef to bison) & more, plus beer & wine.")
        , ListElement(title: "Favela Cubana", icon: "favelalogo", image: "favela", text: "Traditional dishes & drinks from Brazil & Cuba served in an intimate room with tropical decor.")
        , ListElement(title: "Toloache", icon: "toloachelogo", image: "toloache", text: "NoHo outpost of a small chain known for inventive Mexican fare & margaritas, plus a vegetarian menu.")
        , ListElement(title: "Giovani", icon: "giovanilogo", image: "giovani", text: "Cozy, contemporary Italian stalwart serving pizza, wine, pasta dishes & regional Tuscan cuisine.")
        , ListElement(title: "Ramen Takumi", icon: "ramenlogo", image: "ramen", text: "This contemporary Japanese eatery specializing in noodle dishes & sushi offers beer, wine & sake.")
    ]

    var body: some View {
        NavigationView() {
            List(modelData) { restaurant in
//                NavigationLink(destination: ListDetailView(item:restaurant)) {
                    HStack {
                       Image(restaurant.icon).resizable().renderingMode(.original).aspectRatio(contentMode: .fit).frame(width: 80,height: 80)
                       VStack(alignment: .leading) {
                           Text(restaurant.title).font(.headline).fontWeight(.bold)
                           Text(restaurant.text).font(.subheadline).foregroundColor(Color.gray)
                       }
                   }
//                }
            }.navigationBarTitle(Text("Restaurants Near YOU!"), displayMode: .inline)
        }
    }
}


//struct ListDetailView: View {
//
//    var item: ListElement
//
//    var body: some View {
//        VStack{
//            MapView()
//                .edgesIgnoringSafeArea(.top)
//                .frame(height:310)
//                .padding(.top,-50)
//            VStack {
//                Image(item.image).resizable().cornerRadius(30)
//                    .overlay(Rectangle().stroke(Color.white, lineWidth:4))
//                    .shadow(radius:10)
//                    .frame(width:250,height:200)
//                    .offset(y: -100)
//                    .padding(.bottom, -100)
//                Text(item.title)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding(.top, 10)
//            }
//        }
//    }
//}
//
//struct ListDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListDetailView(item: ListElement(title: "", icon: "", image: "", text: ""))
//    }
//}
//
//struct SurpriseList_Previews: PreviewProvider {
//    static var previews: some View {
//        SurpriseList()
//    }
//}
