//
//  AnimalsModel.swift
//  biggersmaller
//
//  Created by Finbar Sheahan on 14/04/2015.
//  Copyright (c) 2015 Finbar Sheahan. All rights reserved.
//

import Foundation
class Animals {
    class var sharedInstance: Animals {
        struct Static {
            static var instance: Animals?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = Animals()
        }
        
        return Static.instance!
    }
    
    let items: [Animal] = [
        Animal(name: "ant", size: 1),
        Animal(name: "mouse", size: 2),
        Animal(name: "cat", size: 3),
        Animal(name: "dog", size: 4),
        Animal(name: "lion", size: 5),
        Animal(name: "rhino", size: 6),
        Animal(name: "elephant", size: 7),
        Animal(name: "blue whale", size: 8)
    ]
    
    func getRandomAnimals(numberOfAnimals: Int) -> [Animal]{
        var animals: [Animal] = []
        for var index = 0; index < numberOfAnimals; ++index {
            animals.append(getRandomAnimal())
        }
        return animals
    }
    
    func getRandomAnimal() -> Animal{
        let randomIndex = Int(arc4random_uniform(UInt32(items.count)))
        return items[randomIndex]
    }
}
