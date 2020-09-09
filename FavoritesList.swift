//
//  RestaurantList.swift
//  Eater
//
//  Created by Tiffany Hsu on 12/4/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//
import SwiftUI
import Foundation
import FirebaseDatabase


struct LE: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var icon: String
    var image: String
    var text: String
    
    //var ref: DatabaseReference!

    //ref = Database.database().reference()
}



//Saigon: Vietnamese eats provider where pho & banh mi are popular, as are sweet potato fries & Thai coffee.
//Bareburger: Casual, eco-minded regional chain for organic burgers (from beef to bison) & more, plus beer & wine.
//Favela Cubana: Traditional dishes & drinks from Brazil & Cuba served in an intimate room with tropical decor.
//Toloache: NoHo outpost of a small chain known for inventive Mexican fare & margaritas, plus a vegetarian menu.
//Giovani: Cozy, contemporary Italian stalwart serving pizza, wine, pasta dishes & regional Tuscan cuisine.
//ramen takumi: This contemporary Japanese eatery specializing in noodle dishes & sushi offers beer, wine & sake.



struct FavoritesList: View{
    var ref: DatabaseReference!
    
    
//    @State private var selected: ListElement
//    @State private var selectedRestaurant: ListElement
    @State private var showModal: Bool = false
    
    @State var data: [LE] = [LE(title: "hehehehe", icon: "saigonlogo", image: "saigon", text: "Vietnamese eats provider where pho & banh mi are popular, as are sweet potato fries & Thai coffee.")
        , LE(title: "Bareburger", icon: "barelogo", image: "bareburger", text: "Casual, eco-minded regional chain for organic burgers (from beef to bison) & more, plus beer & wine.")
        , LE(title: "Favela Cubana", icon: "favelalogo", image: "favela", text: "Traditional dishes & drinks from Brazil & Cuba served in an intimate room with tropical decor.")
        , LE(title: "Toloache", icon: "toloachelogo", image: "toloache", text: "NoHo outpost of a small chain known for inventive Mexican fare & margaritas, plus a vegetarian menu.")
        , LE(title: "Giovani", icon: "giovanilogo", image: "giovani", text: "Cozy, contemporary Italian stalwart serving pizza, wine, pasta dishes & regional Tuscan cuisine.")
        , LE(title: "Ramen Takumi", icon: "ramenlogo", image: "ramen", text: "This contemporary Japanese eatery specializing in noodle dishes & sushi offers beer, wine & sake.")
    ]
    
    
    var body: some View {
        NavigationView() {
            ref = Database.database().reference()
          //  ref.child("")
            List(data) { restaurant in
                NavigationLink(destination: LDE(item:restaurant)) {
                    HStack {
                       Image(restaurant.icon).resizable().renderingMode(.original).aspectRatio(contentMode: .fit).frame(width: 80,height: 80)
                       VStack(alignment: .leading) {
                           Text(restaurant.title).font(.headline).fontWeight(.bold)
                           Text(restaurant.text).font(.subheadline).foregroundColor(Color.gray)
                       }
                        
                   }
                }
            }.edgesIgnoringSafeArea(.top).padding(EdgeInsets(top:-50, leading: 0, bottom: 0, trailing: 0))
        }.navigationBarTitle(Text("Favorite List"), displayMode: .inline)
    }
}


struct LDE: View {
    
    var item: LE
    
    var body: some View {
//        VStack{
//            MapView()
//                .edgesIgnoringSafeArea(.top)
//                .frame(height:310)
//                .padding(.top,-50)
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
                
                Button(action: {
                   // self.isPresented = false
                    
                    //self.didAddList(.init(listName:self.listName))

                }, label: {
                    Text("Add List")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.all, 16)
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 8))

                })
                
                
            }.padding(.top, -30)
 
//        }
    }
}

struct LDE_Previews: PreviewProvider {
    static var previews: some View {
        LDE(item: LE(title: "", icon: "", image: "", text: ""))
    }
}
    
struct FavoritesList_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesList()
    }
}

struct Res : View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Text(restaurant.name)
        }
    }
}
