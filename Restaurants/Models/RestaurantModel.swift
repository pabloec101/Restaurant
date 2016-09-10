//
//  RestaurantModel.swift
//  Restaurants
//
//  Created by admin on 9/09/16.
//  Copyright © 2016 eafit. All rights reserved.
//

import UIKit

typealias CompletionHandler = (success: Bool, response: [Restaurant]) ->()

class RestaurantModel: NSObject {
    
    var restaurants = [Restaurant]()
    
    // MARK: Mocks
    func restaurantsMock() -> [Restaurant] {
        let restaurants:[Restaurant] = [Restaurant.init(name: "El Mexicano", address: "Cra 80", latitude: 6.23333, longitude: -75.3333, category: "Mexicana", image: "mexican-restaurant"),Restaurant.init(name: "El Desayunadero", address: "Cra 80", latitude: 3.23333, longitude: -4.3333, category: "Mexicana", image: "breakfast-restaurant"),Restaurant.init(name: "Carnicero", address: "Cra 80", latitude: 3.23333, longitude: -4.3333, category: "Mexicana", image: "parrilla-restaurant")]
        
        return restaurants
    }
    
    //MARK: Services
    
    func getRestaurantsFromServer(completion: CompletionHandler){
        let request = RestaurantServices()
        request.getRestaurants { (success, response) in
            if success {
                self.restaurants.removeAll()
                
                for item in response {
                    let restaurantTmp = Restaurant(name: item["name"] as! String, details: item["details"] as! String, address: item["address"] as! String, phone: item["phone"] as! String, latitude: item["latitude"] as! Double, longitude: item["longitude"] as! Double, category: item["category"] as! String, wifi: item["wifi"] as! Bool, available: item["available"] as! Bool, ranking: item["ranking"] as! Float, image: item["image"] as! String)
                    
                    self.restaurants.append(restaurantTmp)
                }
                
                completion(success: true, response: self.restaurants)
            } else {
                completion(success: false, response: self.restaurants)
            }
        }
    }
    

}
