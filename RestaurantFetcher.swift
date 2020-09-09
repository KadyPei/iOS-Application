//
//  RestaurantFetcher.swift
//  Eater
//
//  Created by Charmaine Chan on 8/12/2019.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase

public class RestaurantFetcher: ObservableObject {
@Published var restaurants = [Restaurant]()

    init(){
        load()
    }

    func load() {
        let url = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.7297,-73.9972&radius=500&opennow=true&keyword=restaurant&key=AIzaSyAxqYeZ0jnlipcj6IsTumuIcUDOoBvXAwk")!
         URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil || data == nil {
                   print("Client error!")
                   return
               }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            do {
                if let data = data {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                    if let jsonArray = jsonObject as? [String: Any] {
                        if let results = jsonArray["results"] as! [Any]?{
                            for result in results {
                                if let locationDictionary = result as? [String : Any] {
                                    let geometry = locationDictionary["geometry"]! as! [String : Any]
                                    let location = geometry["location"]! as! [String : Any]
                                    let lat = location["lat"]
                                    let long = location["lng"]
                                    let photos = locationDictionary["photos"] as? [[String : Any]]
                                    let newLocation = Restaurant(lat: lat as! Double, long: long as! Double, id: locationDictionary["id"] as? String, name: locationDictionary["name"] as! String, photos: photos, placeID: locationDictionary["place_id"] as? String, priceLevel: locationDictionary["price_level"] as? Int, rating: locationDictionary["rating"] as? Double, logo: "meal");
                                    self.restaurants.append(newLocation!)
                                }
                            }
                        }
                    }
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
