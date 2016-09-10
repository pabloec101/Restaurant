//
//  RestaurantModel.swift
//  Restaurants
//
//  Created by admin on 9/09/16.
//  Copyright © 2016 eafit. All rights reserved.
//

import UIKit

class RestaurantModel: NSObject {
    
    // MARK: Mocks
    func restaurantsMock() -> [Restaurant] {
        let restaurants:[Restaurant] = [Restaurant.init(name: "El Mexicano", address: "Cra 80", latitude: 6.23333, longitude: -75.3333, category: "Mexicana", image: "mexican-restaurant"),Restaurant.init(name: "El Desayunadero", address: "Cra 80", latitude: 3.23333, longitude: -4.3333, category: "Mexicana", image: "breakfast-restaurant"),Restaurant.init(name: "Carnicero", address: "Cra 80", latitude: 3.23333, longitude: -4.3333, category: "Mexicana", image: "parrilla-restaurant")]
        
        return restaurants
    }
    

}
