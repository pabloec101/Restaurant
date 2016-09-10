//
//  RestaurantServices.swift
//  Restaurants
//
//  Created by admin on 10/09/16.
//  Copyright © 2016 eafit. All rights reserved.
//

import UIKit
import Alamofire

public typealias CompletionHandlerGET = (success: Bool, response:[[String: AnyObject]]) ->()

let headers = [
        "Authorization":"Basic a2lkX1N5RG5EcWJoOmRlZTU4NDQ3OTQ3YjQ5YzM4ZGQ2OTI5ZDlmOGI3YWNh",
        "Content-Type":"application/x-www-form-urlencoded"
]

class RestaurantServices: NSObject {
    
    let url = "https://baas.kinvey.com/appdata/kid_SyDnDqbh/restaurants"
    
    func getRestaurants(completion:CompletionHandlerGET){
        Alamofire.request(.GET, url, parameters: nil, headers: headers)
            .responseJSON(){response in
                
                switch response.result {
                case .Success(let JSON):
                    print("Llamado de GET \(JSON)")
                    completion(success: true, response: JSON as! [[String : AnyObject]])
                case .Failure(let error):
                    completion(success: false, response: [["error":error.localizedDescription]])
                }
        }
    }


}
