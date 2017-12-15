//
//  ProtocolsWithCustomAttributes.swift
//  Mocky_Example
//
//  Created by Andrzej Michnia on 16.11.2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import CoreGraphics

struct UserObject {
    let name: String
    let surname: String
    let age: Int
}

//sourcery: AutoMockable
protocol ProtocolWithTuples {
    func methodThatTakesTuple(tuple: (String,Int)) -> Int
}

//sourcery: AutoMockable
protocol ProtocolWithCustomAttributes {
    func methodWith(point: CGPoint) -> Int
    func methodThatTakesUser(user: UserObject) throws
    func methodThatTakesArrayOfUsers(array: [UserObject]) -> Int
}
