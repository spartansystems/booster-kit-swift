//
//  PhotosViewControllerFeatures.swift
//  BoosterKitUITests
//
//  Created by Travis Palmer on 2/13/17.
//  Copyright © 2017 Spartan. All rights reserved.
//

import KIF
import RealmSwift

class PhotosViewControllerFeatures: KIFTestCase {
    
    override func setUp() {
        super.setUp()
        
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPresenceOfMyPreciousView() {
        tester().waitForView(withAccessibilityLabel: "Welcome")
    }
}