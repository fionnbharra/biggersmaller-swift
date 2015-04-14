//
//  Animal.swift
//  biggersmaller
//
//  Created by Finbar Sheahan on 14/04/2015.
//  Copyright (c) 2015 Finbar Sheahan. All rights reserved.
//

import Foundation
class Animal: NSObject {
    var name: String
    var size: Int
    
    init(name: String, size: Int) {
        
        self.name = name
        self.size = size
        
    }
}
