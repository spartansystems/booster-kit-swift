//
//  APIManager.swift
//  BoosterKit
//
//  Created by Travis Palmer on 12/16/16.
//  Copyright © 2016 Spartan. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class APIManager {
    
    struct Constants {
        static let apiURL = "http://jsonplaceholder.typicode.com/photos"
    }
    
    public class func fetchData (completionClosure: @escaping () -> ()) {
        Alamofire.request(Constants.apiURL).responseArray { (response: DataResponse<[Photo]>) in
            let photoArray = response.result.value! as [Photo]
            
            DispatchQueue.global(qos: .background).async {
                // Get realm and table instances for this thread.
                let realm = try! Realm()
                
                realm.beginWrite()
                
                for photo in photoArray {
                    NSLog("Photo \(photo)")
                    realm.add(photo, update: true)
                }
                
                do {
                    NSLog("Saving photos.")
                    try realm.commitWrite()
                } catch {
                    NSLog("Failed saving photos!")
                }
                
                DispatchQueue.main.async {
                    // Run any passed completion closure in the main thread.
                    completionClosure()
                }
            }
        }
    }
}