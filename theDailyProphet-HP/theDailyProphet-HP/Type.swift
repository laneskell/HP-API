//
//  Type.swift
//  Type
//
//  Created by Kell Lanes on 23/07/21.
//

import UIKit

class character {
    var name: String!
    var dateOfBirth: String!
    var house: String!
    var patronus: String!
    var image: String!
    
    init(name: String, dateOfBirth: String, house: String, patronus: String, image:String) {
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.house = house
        self.image = image
        self.patronus = patronus
    }
}

class Person {
    var image: String!
    
    init(image: String) {
        self.image = image
    }
}
