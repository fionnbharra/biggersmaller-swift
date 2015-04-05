//
//  UserModel.swift
//  biggersmaller
//
//  Created by Finbar Sheahan on 04/04/2015.
//  Copyright (c) 2015 Finbar Sheahan. All rights reserved.
//
import Foundation
class User {
    class var sharedInstance: User {
        struct Static {
            static var instance: User?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = User()
        }
        
        return Static.instance!
    }
    
    var userId: Int = 0;
    var score: Int = 0;
    var name: String = "";
}