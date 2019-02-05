//
//  Category.swift
//  Todoey
//
//  Created by Scott Cowie on 12/21/18.
//  Copyright © 2018 Scott Cowie. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
    
}
