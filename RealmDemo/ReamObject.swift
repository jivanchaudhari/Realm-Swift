//
//  ReamObject.swift
//  RealmDemo
//
//  Created by Mindrose on 05/06/17.
//  Copyright © 2017 Mindrose. All rights reserved.
//

import Foundation
import RealmSwift


class Employee: Object {
    
    dynamic var name = " "
    dynamic var ID = 0
    dynamic var deparment = " "
    
    override static func primaryKey() -> String? {
        return "ID"
        
    }
    convenience init(name: String, deparment: String, ID: Int) {
        self.init()
        self.name = name
        self.ID = ID
        self.deparment = deparment
    }

}
