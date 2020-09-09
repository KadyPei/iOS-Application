//
//  Restaurant.swift
//  Eater
//
//  Created by Charmaine Chan on 8/12/2019.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import Foundation

struct Restaurant: Identifiable {

var lat: Double
var long: Double
var id: String?
var name: String
var photos: [[String : Any]]?
var placeID: String?
var priceLevel: Int?
var rating: Double?
var logo: String

    init?(lat: Double, long: Double, id: String?, name: String, photos: [[String : Any]]?, placeID: String?, priceLevel: Int?, rating: Double?, logo: String) {
    self.lat = lat
    self.long = long
    self.id = id
    self.name = name
    self.photos = photos
    self.placeID = placeID
    self.priceLevel = priceLevel
    self.rating = rating
    self.logo = logo
    }
}
