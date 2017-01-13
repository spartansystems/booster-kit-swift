//
//  PhotosViewControllerSpecs.swift
//  BoosterKitSpecs
//
//  Created by Travis Palmer on 10/21/16.
//  Copyright © 2016 Spartan. All rights reserved.
//

import XCTest
@testable import BoosterKit
import Quick
import Nimble
import RealmSwift

class PhotosViewControllerSpecs: QuickSpec {
    override func spec() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        
        describe("initialization") {
            let realm = try! Realm()
            try! realm.write {
                realm.create(Photo.self, value: ["id": 0, "title": "test photo", "thumbnailUrl": "http://test.com"])
                realm.create(Photo.self, value: ["id": 1, "title": "test photo 2", "thumbnailUrl": "http://test.com"])
                realm.create(Photo.self, value: ["id": 2, "title": "test photo 3", "thumbnailUrl": "http://test.com"])
            }
            
            let viewController = PhotosViewController(coder: concreteCoder())
            
            it("initializes photos") {
                expect(viewController!.photos.count).to(equal(3))
            }
        }
    }
    
    fileprivate func concreteCoder() -> NSKeyedUnarchiver {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.finishEncoding()
        
        return NSKeyedUnarchiver(forReadingWith: data as Data)
    }
}
